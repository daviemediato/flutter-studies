import 'package:flutter/material.dart';
import 'package:weather_api/model/city.dart';
import 'package:weather_api/pages/weatherpage.dart';
import 'package:weather_api/structures/constants.dart';

class CardTile extends StatelessWidget {
  final List<City> cities;
  final int index;

  CardTile(this.cities, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      child: ListTile(
        leading: Icon(
          Icons.location_city,
          color: kSecondaryColor,
        ),
        title: Text(
          cities[index].name,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          cities[index].country,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.drag_handle),
          color: kSecondaryColor,
          onPressed: () {},
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherPage(name: cities[index].name),
            ),
          );
        },
      ),
    );
  }
}
