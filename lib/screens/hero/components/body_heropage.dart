import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mlbb_info_app/constants/color_constants.dart';
import 'package:mlbb_info_app/constants/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mlbb_info_app/widgets/hero_gridview.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> role = [
    'Hero',
    'Fighter',
    'Assassin',
    'Marksman',
    'Tank',
    'Support'
  ];

  int picker = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width,
              child: const Image(
                image: AssetImage(
                  'assets/bgnew.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 2,
              color: const Color.fromRGBO(255, 215, 0, 1),
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(13, 3, 69, 1),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  role[i];
                                  picker = i;
                                });
                              },
                              child: i == picker
                                  ? activeButton(i)
                                  : inactiveButton(i, picker),
                              style: buttonStyle),
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
            Container(
              height: 2,
              color: const Color.fromRGBO(255, 215, 0, 1),
            ),
            Expanded(
                child: Container(
                    color: const Color.fromRGBO(9, 2, 51, 1),
                    child: HeroGridView(role: role[picker]))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await launch(
              'https://mobile-legends.fandom.com/wiki/Mobile_Legends:_Bang_Bang_Wiki');
        },
        label: Text(
          'MLBB WIKI',
          style: hTextStyle9,
        ),
        icon: const ImageIcon(
          AssetImage('assets/encyclopedia.png'),
          color: Color.fromRGBO(9, 2, 51, 1),
        ),
        backgroundColor: Colors.yellow.shade700,
      ),
    );
  }

  dotWidget() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: goldColor,
      ),
      width: 4,
      height: 4,
    );
  }

  activeButton(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        inactiveButton(index, index),
        const SizedBox(
          height: 4,
        ),
        dotWidget()
      ],
    );
  }

  inactiveButton(index, pick) {
    return role[index] == 'Hero'
        ? Text('All Hero', style: index == pick ? hTextStyle3 : hTextStyle1)
        : Text(role[index], style: index == pick ? hTextStyle3 : hTextStyle1);
  }
}
