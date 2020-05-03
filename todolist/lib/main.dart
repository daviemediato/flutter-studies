import 'package:flutter/material.dart';
import 'pages/todolist.splashscreen.dart';

void main() => runApp(ToDoList());

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoListSplashScreen(),
    );
  }
}
