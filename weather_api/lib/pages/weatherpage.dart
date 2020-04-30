import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_api/model/weathermodel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api/structures/constants.dart';

class WeatherPage extends StatefulWidget {
  final String name;

  const WeatherPage({Key key, this.name}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherModel>(
        future: _getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModel weatherModel = snapshot.data;
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${weatherModel.weather[0].description}.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        '${weatherModel.name}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                      Text(
                        '${weatherModel.main.temp} °',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                      Text(
                        '${weatherModel.weather[0].description} ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<WeatherModel> _getWeather() async {
    final weatherResponse = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=${widget.name}&appid=228a823649b5de95900a289c5036a960&units=metric');

    if (weatherResponse.statusCode == 200) {
      var weatherResult = json.decode(weatherResponse.body);
      var weatherModel = WeatherModel.fromJson(weatherResult);
      return weatherModel;
    } else {
      throw Exception('Failed to load Weather Information');
    }
  }
}
