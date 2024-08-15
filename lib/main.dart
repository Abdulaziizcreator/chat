import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: Color(0xff152750),
              // Background color of the nav bar
              indicatorColor: Colors.blue.withOpacity(0.2),
              // Background color of the selected item
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return TextStyle(color: Colors.white, fontSize: 15);
                  }
                  return TextStyle(color: Colors.grey);
                },
              ),
              iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return IconThemeData(color: Color(0xff08E9BD));
                  }
                  return IconThemeData(color: Colors.grey);
                },
              ),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: ChatPage(),
          home: IntroPage(),
        );
      },
    );
  }
}
