import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'assistant_page.dart';
import 'chat_page/table_chat_screen.dart';
import 'home_page_new.dart';
import 'learn_screeen.dart';

class BottomNavBarWidget extends StatefulWidget {
  static const String id = 'BottomNavBarWidget';

  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int selectedPage = 0;

  final List<dynamic> _pageOptions = [
    HomePageNew(),
    AssistantsPage(),
    LearnPage(),
    ChatScreen( ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedPage,
          onDestinationSelected: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home_25), label: "Home"),
            NavigationDestination(
                icon: Icon(Iconsax.category_25), label: "Assistants"),
            NavigationDestination(icon: Icon(Icons.school), label: "Learn"),
            NavigationDestination(icon: Icon(Iconsax.messages_15), label: "Chat"),
          ],
        ));
  }
}
