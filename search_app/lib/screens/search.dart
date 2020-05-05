import 'package:flutter/material.dart';
import 'package:search_app/constantes.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "sup search screen",
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
