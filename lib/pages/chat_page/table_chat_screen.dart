import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/pages/chat_page/text_chatting_page.dart';

import '../../controllers/test_audio_chat_controller.dart';
import 'audio_chatting_page_ishlaydi.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152750),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff152750),
        title: Text(
          "Chat Screen 👋",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 20.sp,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TextChattingPage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/text_question.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send Text",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "You can send your questions via text",
                          style: TextStyle(
                              color: Color(0xff6C7771),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AudioPlayerScreen()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/audio_question.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send Audio",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "You can ask your questions via audio",
                          style: TextStyle(
                              color: Color(0xff6C7771),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
