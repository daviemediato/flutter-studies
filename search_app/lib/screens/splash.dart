import 'package:flutter/material.dart';
import 'package:search_app/constantes.dart';

import 'homepage.dart';

class SearchSplash extends StatefulWidget {
  @override
  _SearchSplashState createState() => _SearchSplashState();
}

class _SearchSplashState extends State<SearchSplash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then(
      (_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchHomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "lado",
              style: TextStyle(
                color: kWhiteColor.withOpacity(0.97),
                fontSize: 30,
              ),
            ),
            Text(
              "b",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
