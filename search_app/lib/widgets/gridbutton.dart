import 'package:flutter/material.dart';
import 'package:search_app/constantes.dart';

class GridButton extends StatelessWidget {
  final Widget screen;
  final IconData icon;

  const GridButton({Key key, this.screen, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSecondaryColor.withOpacity(0.69),
      ),
      child: FlatButton(
        child: Icon(
          icon,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}
