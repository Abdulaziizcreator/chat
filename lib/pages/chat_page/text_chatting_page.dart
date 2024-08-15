import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/chat_controller.dart';

class TextChattingPage extends StatefulWidget {
  const TextChattingPage({super.key});

  @override
  State<TextChattingPage> createState() => _TextChattingPageState();
}

class _TextChattingPageState extends State<TextChattingPage> {
  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      backgroundColor: const Color(0xff152750),
      appBar: AppBar(
        backgroundColor: const Color(0xff152750),
        title: const Text(
          "Text Chatting",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatController.scrollController,
                itemCount: chatController.messages.length + 1,
                itemBuilder: (context, index) {
                  // If it's the last item, check if Lottie should be shown
                  if (index == chatController.messages.length) {
                    return chatController.writing.value
                        ? Align(
                      alignment: Alignment.centerLeft,
                      child: Lottie.asset(
                        "assets/lotties/pen.json",
                        height: 90,
                        width: 90,
                      ),
                    )
                        : const SizedBox.shrink();
                  }

                  final message = chatController.messages[index];
                  final isUserMessage = message['align'] == 'right';
                  final audioUrl = message['audioUrl'];

                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? const Color(0xff3061F4)
                            : const Color(0xff0F192E),
                        borderRadius: isUserMessage
                            ? const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                            : const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: isUserMessage
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['text']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          if (audioUrl != null && audioUrl.isNotEmpty)
                            IconButton(
                              icon: Obx(
                                    () => Icon(
                                  chatController.currentPlayingIndex.value ==
                                      index &&
                                      chatController.isPlaying.value
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () =>
                                  chatController.playAudio(index, audioUrl),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController.textController,
                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Enter a message...',
                        hintStyle: TextStyle(color: Colors.grey.shade300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fillColor: const Color(0xff171717),
                        filled: true,
                        contentPadding:
                        const EdgeInsets.fromLTRB(15, 15, 50, 15),
                        suffixIcon: Obx(
                              () => IconButton(
                            icon: Icon(
                              Icons.send,
                              color: chatController.isTextEntered.value
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            onPressed: chatController.isTextEntered.value
                                ? () {
                              chatController.sendMessage(
                                textRequest:
                                chatController.textString.value,
                              );
                              chatController.textController.clear();
                            }
                                : null,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
