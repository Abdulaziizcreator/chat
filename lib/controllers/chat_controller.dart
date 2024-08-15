import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var messages = <Map<String, String>>[].obs;
  var currentPlayingIndex = (-1).obs;
  var isPlaying = false.obs;
  final TextEditingController textController = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ScrollController scrollController = ScrollController();
  var isTextEntered = false.obs;
  var textString = ''.obs;
  var writing = false.obs; // Lottie animation tracking
  final Logger logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying.value = false;
        currentPlayingIndex.value = -1;
      } else if (state.playing) {
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
      }
    });

    textController.addListener(() {
      isTextEntered.value = textController.text.isNotEmpty;
      textString.value = textController.text.trim();
    });
  }

  Future<void> sendMessage({required String textRequest}) async {
    // Show Lottie animation
    writing.value = true;

    logger.d("Sending message: $textRequest");

    // Add user message
    messages.add({
      'text': textRequest,
      'align': 'right',
      'audioUrl': "",
    });

    // Scroll to the bottom when a new message is added
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    try {
      var response = await Dio().post(
        'http://176.221.29.220/main/text-question/',
        data: {'text': textRequest},
        options: Options(headers: {
          "Authorization": "token ea3597009544508fc0a05bbe5e0ccdb5b58c3622",
        }),
      );
      logger.d("Response data: ${response.data}");

      var textAnswer = response.data['uz_answer'];
      var audioAnswer =
          'http://176.221.29.220${response.data['audio_answer']['audio']}';

      int index = messages.length;
      // Add response message
      messages.add({
        'text': textAnswer,
        'align': 'left',
        'audioUrl': audioAnswer,
      });
      logger.d("Messages after response: $messages");

      // Ensure Lottie animation is hidden before updating UI
      writing.value = false;

      Future.delayed(const Duration(milliseconds: 100), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );

        // Automatically play the audio response
        if (audioAnswer.isNotEmpty) {
          playAudio(index, audioAnswer);
        }
      });

      // Clear the text controller
      textController.clear();
    } catch (e) {
      logger.e("Error sending message: $e");
      writing.value = false; // Hide Lottie animation even on error
    }
  }

  Future<void> playAudio(int index, String audioUrl) async {
    if (currentPlayingIndex.value == index) {
      isPlaying.value = false;
      await _audioPlayer.stop();
      currentPlayingIndex.value = -1;
    } else {
      if (isPlaying.value && currentPlayingIndex.value != -1) {
        await _audioPlayer.stop();
      }
      String localPath = await getBytes(audioUrl);
      await _audioPlayer.setFilePath(localPath);
      currentPlayingIndex.value = index;
      isPlaying.value = true;
      await _audioPlayer.play();
    }
  }

  Future<String> getBytes(String url) async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/${generateRandomString(10)}.mp3');
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(
        len, (index) => r.nextInt(33) + 89)); // Random file name generator
  }
}
