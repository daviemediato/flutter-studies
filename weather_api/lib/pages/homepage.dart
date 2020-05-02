import 'package:flutter/material.dart';
import 'package:weather_api/model/city.dart';
import 'package:weather_api/structures/constants.dart';
import 'package:weather_api/structures/helper.dart';
import 'package:weather_api/widgets/homepage/card.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  List<Color> colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green];
  List<City> cities = new List();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  Helper helper = new Helper();

  Color _backgroundColor() {
    int rand = 2;
    return colors[rand];
  }

  void _getAllCities() {
    helper.getAllCities().then((list) {
      setState(() {
        cities = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: _backgroundColor(),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 50),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "How is the",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 100,
            child: Text(
              "weather in your city?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
          Positioned(
            left: 240,
            top: 200,
            child: Text(
              "check it out!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250, left: 40, right: 60),
            child: cities.length == 0
                ? Center(
                    child: Text(
                      "Lets add a City ! :)",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CardTile(cities, index);
                    },
                  ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: Center(
                child: IconButton(
                  iconSize: 15,
                  icon: Icon(
                    Icons.add,
                    color: _backgroundColor(),
                  ),
                  onPressed: () {
                    _showAddButton();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: kPrimaryColor,
          content: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "Lets save a city!",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: _backgroundColor(),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _backgroundColor(),
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Name a City!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _backgroundColor(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _backgroundColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _backgroundColor(),
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Name a Country!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _backgroundColor(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _backgroundColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _countryController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _backgroundColor(),
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Now, just save!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _backgroundColor(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _backgroundColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FlatButton(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              City city = new City(
                                _cityController.text,
                                _countryController.text,
                              );
                              helper.saveCity(city);
                              _getAllCities();
                              _cityController.text = "";
                              _countryController.text = "";
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
