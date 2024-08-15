import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_nav_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.6,
                  center: Alignment.center,
                  colors: [
                    Color(0xff152750),
                    Color(0xff3056D6),
                    Color(0xff3056D6),
                    Color(0xff152750),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 180.h),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 400.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.greenAccent.withOpacity(0.2),
                              Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/image/robot3.png',
                        height: 250.h,
                        width: 200.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Study AI Assistant',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontFamily: "Inter",
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Smart Support for Every Student",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Inter",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          Container(
            height: 70.h, // Ensure consistent height of 70
            decoration: BoxDecoration(color: Color(0xff152750),border: Border.all(color:  Color(0xff152750),width: 0)),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarWidget(),
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff2E61F4),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      "Get Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
