import 'package:flutter/material.dart';
import 'package:mlbb_info_app/constants/color_constants.dart';
import 'package:mlbb_info_app/constants/style_constants.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> web = ['MPL ID', 'MDL ID', 'MLBB Tournament Statistic'];

  List<String> webLink = [
    'https://id-mpl.com/',
    'https://id-mdl.com/',
    'https://escharts.com/tournaments/mobile-legends'
  ];

  int picker = 0;
  final _key = UniqueKey();
   bool _isLoadingPage= true;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 2,
            color: const Color.fromRGBO(255, 215, 0, 1),
          ),
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(13, 3, 69, 1),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              web[i];
                              picker = i;
                              _isLoadingPage = true;
                              controller.loadUrl(webLink[picker]);
                            });
                          },
                          child: i == picker
                              ? activeButton(i)
                              : inactiveButton(i, picker),
                          style: buttonStyle,
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
          Expanded(
            child: WebView(
              key: _key,
              initialUrl: webLink[picker],
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
              onPageFinished: (finish) {
                setState(() {
                  _isLoadingPage = false;
                });
              },
            ),
          ),
        ],
      ),
    ));
  }

  dotWidget() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: goldColor,
      ),
      width: 8,
      height: 8,
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
    return web[index] == 'Hero'
        ? Text('All Hero', style: index == pick ? hTextStyle8 : hTextStyle7)
        : Text(web[index], style: index == pick ? hTextStyle8 : hTextStyle7);
  }
}
