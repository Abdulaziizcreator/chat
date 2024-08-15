import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../service/audio_post_service.dart';
import 'package:http/http.dart' as http;

class AudioController extends GetxController {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  FlutterSoundPlayer player = FlutterSoundPlayer();
  Rx<Duration> duration = Duration.zero.obs;
  Rx<Duration> position = Duration.zero.obs;
  var isPlayerInitialized = false.obs;

  RxBool isRecording = false.obs;
  RxString filePath = ''.obs;
  RxInt recordingDuration = 0.obs;
  Timer? _timer;
  var audioUrl = "".obs;
  var userRequest = "".obs;
  var answerText = "".obs;
  RxBool isUploading = false.obs; // Indicates if the audio is being uploaded
  RxBool showAudioPlayer = false.obs; // Controls visibility of the audio player
  RxBool isPlaying =
      false.obs; // Indicates whether the audio is currently playing

  final AudioUploadService _uploadService = AudioUploadService();
  final Logger logger = Logger();

  RxList<String> displayedWords = <String>[].obs;

  void displayAnswerTextWithDelay() async {
    List<String> words = answerText.value.split(' ');
    displayedWords.clear(); // Clear any previous words

    for (int i = 0; i < words.length; i++) {
      displayedWords.add(words[i]);
      await Future.delayed(Duration(milliseconds: 800));
    }
  }

  void initializePlayer() async {
    try {
      await player.openPlayer();
      isPlayerInitialized.value = true;

      // Listen to player state changes
      player.onProgress!.listen((e) {
        position.value = e.position;
        duration.value = e.duration;
      });
    } catch (e) {
      print("Player initialization error: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializePlayer(); // Initialize the player when the controller is initialized
  }

  Future<void> initRecorder() async {
    try {
      await recorder.openRecorder();
      logger.i('Recorder opened successfully');
    } catch (e) {
      logger.e('Error opening recorder: $e');
    }
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      Get.snackbar(
        'Permission Denied',
        'Microphone access is required to record audio.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception('Microphone permission not granted');
    }
  }

  void startRecordingTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      recordingDuration.value++;
    });
  }

  void stopRecordingTimer() {
    _timer?.cancel();
    recordingDuration.value = 0;
  }

  Future<void> startRecording() async {
    await requestPermissions();

    try {
      if (!recorder.isRecording) {
        await initRecorder();
      }

      final directory = await getApplicationDocumentsDirectory();
      filePath.value = '${directory.path}/recorded_audio.aac';

      await recorder.startRecorder(
        toFile: filePath.value,
        codec: Codec.aacADTS,
      );

      isRecording.value = true;
      startRecordingTimer();
    } catch (e) {
      logger.e('Error starting recording: $e');
      isRecording.value = false;
    }
  }

  Future<void> stopRecording() async {
    try {
      if (!recorder.isRecording) return;

      await recorder.stopRecorder();
      isRecording.value = false;
      stopRecordingTimer();

      logger.i("Recording stopped. Audio file saved at: ${filePath.value}");
    } catch (e) {
      logger.e('Error stopping recording: $e');
    }
  }

  Future<void> uploadAudioAndProcessResponse() async {
    isUploading.value = true;

    try {
      final audioFile = File(filePath.value);

      if (await audioFile.exists()) {

        final response = await _uploadService.uploadAudio(audioFile);
        logger.i(response);

        String audioAnswer = response['audio_answer']['audio'];
        userRequest.value = response["recognized_text"];
        answerText.value = response["uz_answer"];

        audioUrl.value = audioAnswer;

        isUploading.value = false;
        showAudioPlayer.value = true;
        displayAnswerTextWithDelay();

        // Automatically play the audio from the API response
        playAudioFromApiResponse();
      } else {
        logger.w('Audio file does not exist: ${filePath.value}');
      }
    } catch (e) {
      logger.e('Error uploading audio or processing response: $e');
      isUploading.value = false;
    }
  }


  Future<void> playAudioFromApiResponse() async {
    final url = 'http://176.221.29.220$audioUrl';
    await playAudio(url);
  }

  Future<void> playAudio(String audioUrl) async {
    try {
      if (player.isPlaying) {
        await player.stopPlayer();
        isPlaying.value = false;
      } else {
        String localPath = await getBytes(audioUrl);
        await player.startPlayer(
            fromURI: localPath,
            whenFinished: () {
              isPlaying.value =
                  false; // Update isPlaying when the audio finishes
            });
        isPlaying.value = true;

      }
    } catch (e) {
      logger.e('Error playing audio: $e');
      isPlaying.value = false;
    }
  }

  Future<String> getBytes(String url) async {
    try {
      Uri uri = Uri.parse(url);
      var rng = Random();
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file = File('$tempPath/${rng.nextInt(100)}.m4a');

      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
      } else {
        throw Exception('Failed to download audio file');
      }

      return file.path;
    } catch (e) {
      logger.e('Error downloading or saving file: $e');
      rethrow;
    }
  }

  void seekTo(Duration position) {
    if (isPlayerInitialized.value) {
      player.seekToPlayer(position);
    } else {
      print("Player is not initialized.");
    }
  }

  Future<void> pauseAudio() async {
    if (player.isPlaying) {
      await player.pausePlayer();
      isPlaying.value = false;
    }
  }

  Future<void> retryAudio() async {
    await player.stopPlayer();
    isPlaying.value = false;
    position.value = Duration.zero; // Reset the position to the beginning
  }

  @override
  void onClose() {
    recorder.closeRecorder();
    player.closePlayer();
    _timer?.cancel();
    super.onClose();
  }
}
