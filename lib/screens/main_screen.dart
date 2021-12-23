import 'package:mlbb_info_app/constants/color_constants.dart';
import 'package:mlbb_info_app/screens/competition/competition_screen.dart';

import 'package:mlbb_info_app/screens/hero/hero_screen.dart';

import 'package:mlbb_info_app/screens/news/news_screen.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _body() => SizedBox.expand(
        child: IndexedStack(
          index: currentIndex,
          children: const <Widget>[
            NewsScreen(),
            HeroScreen(),
            CompetitionScreen(),
          ],
        ),
      );

  Widget _bottomNavBar() => BottomNavBar(
        showElevation: true,
        selectedIndex: currentIndex,
        animationDuration: const Duration(milliseconds: 0),
        backgroundColor: const Color.fromRGBO(13, 3, 69, 1),
        onItemSelected: (index) {
          setState(() => currentIndex = index);
        },
        items: <BottomNavBarItem>[
          BottomNavBarItem(
            title: 'News',
            icon: const ImageIcon(AssetImage('assets/news.png')),
            activeColor: goldColor,
            inactiveColor: darkgoldCOlor,
          ),
          BottomNavBarItem(
            title: 'Heroes',
            icon: const ImageIcon(AssetImage('assets/home.png')),
            activeColor: goldColor,
            inactiveColor: darkgoldCOlor,
          ),
          BottomNavBarItem(
            title: 'Tournament',
            icon: const ImageIcon(AssetImage('assets/competition.png')),
            activeColor: goldColor,
            inactiveColor: darkgoldCOlor,
          ),
        ],
      );
}
