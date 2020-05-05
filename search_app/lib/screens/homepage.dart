import 'package:flutter/material.dart';
import 'package:search_app/constantes.dart';
import 'package:search_app/widgets/gridbutton.dart';

import 'search.dart';

class SearchHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 50,
        padding: EdgeInsets.symmetric(vertical: 200, horizontal: 80),
        children: List.generate(
          4,
          (index) {
            if (index == 1) {
              return GridButton(
                screen: SearchScreen(),
                icon: Icons.search,
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kSecondaryColor.withOpacity(0.69),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
