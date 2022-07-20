import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

import 'forecast.dart';
import 'home.dart';
import 'search.dart';
import 'help.dart';

/// ROOT PAGE (We start from here)
/// 1. start from route '/'
/// 2. Navigation bar from main
/// 3. use body views and index to display the pages
/// (pages include, home, transaction and create pages)
class Launcher extends StatefulWidget {
  static const routeName = '/';

  const Launcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int index = 0;

  /// all the screens
  final screens = [
    const Home(),
    const Forecast(),
    const Search(),
    const Help(),
  ];

  final items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
    const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'สภาพอากาศ'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'ค้นหา'),
    const BottomNavigationBarItem(icon: Icon(Icons.info), label: 'ช่วยเหลือ'),

  ];

  /// Use curvedNavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar:
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kSecondaryColor,
          currentIndex: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
          backgroundColor: kMainColor,
          showUnselectedLabels: false,
        ),
    );
  }
}