import 'package:flutter/material.dart';
import 'package:mlbb_info_app/screens/hero/hero_screen.dart';
import 'package:mlbb_info_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MLBB INFO',
        routes: {
          '/home': (context) => const HeroScreen(),
        },
        home: const MainScreen());
  }
}
