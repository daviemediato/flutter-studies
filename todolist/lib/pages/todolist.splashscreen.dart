import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'todolist.homepage.dart';
import 'package:google_fonts/google_fonts.dart';

//Aqui estamos fazendo um codigo para a preparacao da homepage, ou seja, um splash screen

class ToDoListSplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<ToDoListSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 7,
        navigateAfterSeconds:
            ToDoListHomePage(), //apos o splash screen ira para a pagina ToDoListHomePage
        image: Image.asset(
          "assets/images/check.png",
          alignment: Alignment.center,
        ),
        loadingText: Text(
          "Loading...",
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 51, 1),
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.white);
  }
}
