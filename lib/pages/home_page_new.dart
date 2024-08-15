import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152750),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff152750),
        title: Text(
          "Welcome Back 👋",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.h,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        // color: Color(0xff17231F),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white,width: 1.5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.book,
                                color: Color(0xff07E9BE),
                                size: 13.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Weekly Goal",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h),
                          CircularPercentIndicator(
                            startAngle: 0,
                            radius: 50.0,
                            lineWidth: 8.0,
                            animation: true,
                            percent: 0.45,
                            center: Text(
                              "45%",
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                            backgroundColor: Color(0xff304EFC),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.white,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Studied: 2.5/3.0h",
                            style: TextStyle(
                                color: Color(0xffd7dbda), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 200.h,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        // color: Color(0xff17231F),
                        borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white,width: 1.5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.battery_charging4,
                                color: Color(0xff07E9BE),
                                size: 14.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Energy",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                            'assets/image/robot3.png',
                            height: 85.h,
                            width: 65.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "100%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                          LinearProgressIndicator(
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(30),
                            value: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
              child: Text(
                "Daily Motivation",
                style: TextStyle(
                    fontSize: 18, fontFamily: "Inter", color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                   // color: Color(0xff17231F),
                    borderRadius: BorderRadius.circular(25),border: Border.all(color: Colors.white,width: 1.5)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_left,
                      size: 30.sp,
                      color: Color(0xff798682),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        '''"Your are taking important step\ntowards you future"''',
                        style: TextStyle(
                            color: Color(0xffA7A9A9),
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right,
                      size: 30.sp,
                      color: Color(0xff798682),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                padding: EdgeInsets.only(left: 15,top: 10,right: 10,bottom: 10),
                decoration: BoxDecoration(
                    // color: Color(0xff17231F),
                    border: Border.all(color: Colors.white,width: 1.5),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.videocam,
                              color: Color(0xff07E9BE),
                              size: 21.sp,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Record now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Record your class and have \na summery with notes',
                          style: TextStyle(
                            color: Color(0xffA7A9A9),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 120.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: AssetImage("assets/image/lesson.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tools for TCC",
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Inter", color: Colors.white),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14, color: Color(0xffA7A9A9)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: SizedBox(
                height: 120.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: 120.h,
                      width: 200.w,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        //color: Color(0xff17231F),
                          border: Border.all(color: Colors.white,width: 1.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Extractor",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.book,
                                color: Color(0xff07E9BE),
                                size: 13.sp,
                              ),
                            ],
                          ),
                          Text(
                            'Lorem Impsum is simiply \ndummy text of the \nmore difficult',
                            style: TextStyle(
                              color: Color(0xffA7A9A9),
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 120.h,
                      width: 200.w,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        //color: Color(0xff17231F),
                        border: Border.all(color: Colors.white,width: 1.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Theme",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.book,
                                color: Color(0xff07E9BE),
                                size: 13.sp,
                              ),
                            ],
                          ),
                          Text(
                            'Lorem Impsum is simiply \ndummy text of the \nmore difficult',
                            style: TextStyle(
                              color: Color(0xffA7A9A9),
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
