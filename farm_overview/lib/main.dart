import 'package:flutter/material.dart';
import 'pages/farm_homepage.dart';

void main() {
  runApp(FarmApp());
}

class FarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Overiview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FarmHomePage(),
    );
  }
}
