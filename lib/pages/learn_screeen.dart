import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152750),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff152750),
        title: Text(
          "Learn Screen 👋",
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
    );
  }
}
