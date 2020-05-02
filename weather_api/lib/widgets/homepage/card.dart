import 'package:flutter/material.dart';
import 'package:weather_api/model/city.dart';
import 'package:weather_api/pages/weatherpage.dart';
import 'package:weather_api/structures/constants.dart';
import 'package:weather_api/structures/helper.dart';

class CardTile extends StatefulWidget {
  final List<City> cities;
  final int index;

  CardTile(this.cities, this.index);

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  final Helper helper = new Helper();

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
          widget.cities[widget.index].name,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          widget.cities[widget.index].country,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.drag_handle),
          color: kSecondaryColor,
          onPressed: () {
            _showDrag(context);
          },
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WeatherPage(name: widget.cities[widget.index].name),
            ),
          );
        },
      ),
    );
  }

  void _showDrag(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Hmm...deleting?',
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'This is annoying message from this stupid weather app :/.',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                helper.deleteCity(widget.cities[widget.index].id);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
