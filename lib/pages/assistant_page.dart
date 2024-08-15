import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_page/text_chatting_page.dart';

class AssistantsPage extends StatefulWidget {
  const AssistantsPage({super.key});

  @override
  State<AssistantsPage> createState() => _AssistantsPageState();
}

class _AssistantsPageState extends State<AssistantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152750),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff152750),
        title: Text(
          "Assistants",
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
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => TextChattingPage()));
            // },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white, width: 1.5.w),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/sobirjon.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Sobirjon",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500),
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
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => TextChattingPage()));
            // },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white, width: 1.5.w),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/girl.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      "Aniya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500),
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
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => TextChattingPage()));
            // },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white, width: 1.5.w),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/woman2.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Daniya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500),
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
          ),InkWell(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => TextChattingPage()));
            // },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white, width: 1.5.w),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/woman2.svg",
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Yekaterina",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500),
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
