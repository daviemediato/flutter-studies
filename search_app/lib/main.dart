import 'package:flutter/material.dart';
import 'package:search_app/constantes.dart';
import 'screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        primarySwatch: Colors.blue,
      ),
      home: SearchSplash(),
    );
  }
}
