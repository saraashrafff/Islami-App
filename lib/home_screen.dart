import 'package:flutter/material.dart';
import 'package:islami/hadeth_tab.dart';
import 'package:islami/nav_bar_selected_icons.dart';
import 'package:islami/nav_bar_unselected_icons.dart';
import 'package:islami/quran_tab.dart';
import 'package:islami/radio_tab.dart';
import 'package:islami/sebha_tab.dart';
import 'package:islami/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> backgroundImageNames = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,

            image: AssetImage(
              'assets/images/${backgroundImageNames[currentIndex]}.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.15,
              fit: BoxFit.fitWidth,
            ),
            tabs[currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcons(iconName: 'quran'),
            activeIcon: NavBarSelectedIcons(iconName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcons(iconName: 'hadith'),
            activeIcon: NavBarSelectedIcons(iconName: 'hadith'),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcons(iconName: 'sebha'),
            activeIcon: NavBarSelectedIcons(iconName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcons(iconName: 'radio'),
            activeIcon: NavBarSelectedIcons(iconName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcons(iconName: 'time'),
            activeIcon: NavBarSelectedIcons(iconName: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
