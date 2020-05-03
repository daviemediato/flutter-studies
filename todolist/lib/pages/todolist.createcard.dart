import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/structure/task.dart';
import 'package:todolist/structure/taskDb.dart';

class CreateCard extends StatefulWidget {
  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  String dropdownValue = 'Low';
  Task task;
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  Helper helper = Helper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "New task",
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Title:",
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Type the name of the task here",
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    fillColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  minLines: 4,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Description:",
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Type the description of the task here",
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    fillColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 8),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Priority:",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Low', 'Normal', 'High', 'Urgent']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        _saveTask();
                      },
                      child: Text(
                        "Create",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _saveTask() {
    if (titleController.text != "" && descriptionController.text != "") {
      task = new Task(titleController.text, false, dropdownValue,
          descriptionController.text);
      Navigator.pop(context, task);
    } else {
      _showMessage();
    }
  }

  _showMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: Colors.transparent,
          content: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Please, fill all fields!",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
