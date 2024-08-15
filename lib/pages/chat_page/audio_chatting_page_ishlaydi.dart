import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/audio_recorder_controller_ishlaydi.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioController audioController = Get.put(AudioController());

  @override
  void initState() {
    super.initState();
    audioController.initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff152750),
      appBar: AppBar(
        backgroundColor: const Color(0xff152750),
        title: const Text(
          "Audio Chatting",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            if (audioController.showAudioPlayer.value)
              return Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff0F192E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 200.h, // Bu yerda balandlikni belgiladik
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            "Your request: ${audioController.userRequest.value}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "Answer: ${audioController.answerText.value}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            else {
              return SizedBox();
            }
          })
        ],
      ),
      bottomSheet: Container(
        height: 430.h,
        color: Color(0xff152750),
        child: Column(
          children: [
            Spacer(),
            Obx(() {
              if (audioController.isUploading.value) {
                return Lottie.asset('assets/lotties/uploading.json',
                    width: 100.w, height: 100.h);
              } else if (audioController.showAudioPlayer.value) {
                return Column(
                  children: [
                    SizedBox(
                      height: 250.h,
                      child: Obx(() {
                        return Column(
                          children: [
                            Obx(
                              () => audioController.isPlaying.value
                                  ? Lottie.asset('assets/lotties/listen.json',
                                      width: 150.w, height: 150.h)
                                  : Padding(
                                      padding: const EdgeInsets.all(45),
                                      child: Container(
                                        height: 65.h,
                                        width: 65.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff02BC32),
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          CupertinoIcons.mic,
                                          color: Colors.white,
                                          size: 30,
                                          weight: 0.8,
                                        ),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (audioController.isPlaying.value) {
                                  audioController.pauseAudio();
                                } else {
                                  audioController.playAudioFromApiResponse();
                                }
                              },
                              child: Container(
                                width: 100.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: audioController.isPlaying.value
                                      ? Colors.red
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    audioController.isPlaying.value
                                        ? 'Stop'
                                        : 'Play',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            }),
            Obx(() => GestureDetector(
                  onTap: () => audioController.isRecording.value
                      ? audioController.stopRecording()
                      : audioController.startRecording(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 90.h,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff475569),
                    ),
                    child: Center(
                      child: Icon(
                        audioController.isRecording.value
                            ? CupertinoIcons.mic_solid
                            : CupertinoIcons.mic_slash_fill,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 10),
              child: GestureDetector(
                onTap: () => audioController.uploadAudioAndProcessResponse(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent.shade400,
                  ),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
