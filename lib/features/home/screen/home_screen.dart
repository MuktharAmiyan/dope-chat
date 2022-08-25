import 'package:dope_chat/features/account/screen/account_screen.dart';
import 'package:dope_chat/features/chat/screen/chat_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../common/widgets/search/screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier(1);
  final pageList = const [ChatScreen(), SearchScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _selectedIndexNotifier,
        builder: (BuildContext context, int value, _) {
          return Scaffold(
            appBar: value == 0
                ? AppBar(
                    title: const Text(
                      "Dope Chat.",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )
                : null,
            body: pageList[value],
            bottomNavigationBar: GNav(
              backgroundColor: Colors.black87,
              rippleColor: Colors.grey.shade800,
              hoverColor: Colors.grey.shade700,
              haptic: true,
              tabBorderRadius: 30,
              tabActiveBorder: Border.all(color: Colors.black, width: 1),
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),
              color: Colors.grey[800],
              gap: 5,
              activeColor: Colors.white,
              iconSize: 28,
              tabBackgroundColor: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              selectedIndex: _selectedIndexNotifier.value,
              onTabChange: (value) {
                _selectedIndexNotifier.value = value;
              },
              tabs: const [
                GButton(
                  icon: Icons.chat_bubble_outline_outlined,
                  text: "Chat",
                ),
                GButton(
                  icon: Icons.search_outlined,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.person_outlined,
                  text: "Account",
                ),
              ],
            ),
          );
        });
  }
}
