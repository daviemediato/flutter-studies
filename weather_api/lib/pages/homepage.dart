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
    cities.add(new City("Roskilde", "Dinamarca"));
    cities.add(new City("Belo Horizonte", "Brazil"));
    cities.add(new City("London", "England"));
    //_getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView.separated(
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
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
