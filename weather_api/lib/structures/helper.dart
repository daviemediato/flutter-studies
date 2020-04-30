import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weather_api/model/city.dart';

final String citiesTable = "citiesTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String countryColumn = "countryColumn";

class Helper {
  static final Helper _instance = Helper.internal();

  factory Helper() => _instance;

  Helper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "citiesnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $citiesTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $countryColumn TEXT);");
    });
  }

  Future<City> saveCity(City city) async {
    Database dbCity = await db;
    city.id = await dbCity.insert(citiesTable, city.toMap());
    return city;
  }

  Future<City> getCity(int id) async {
    Database dbCity = await db;
    List<Map> maps = await dbCity.query(citiesTable,
        columns: [
          idColumn,
          nameColumn,
          countryColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return City.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteCity(int id) async {
    Database dbCity = await db;
    return await dbCity
        .delete(citiesTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateCity(City city) async {
    Database dbCity = await db;
    return await dbCity.update(citiesTable, city.toMap(),
        where: "$idColumn = ?", whereArgs: [city.id]);
  }

  Future<List> getAllCities() async {
    Database dbCity = await db;
    List listMap = await dbCity.rawQuery("SELECT * FROM $citiesTable ");
    List<City> cities = List();
    for (Map m in listMap) {
      cities.add(City.fromMap(m));
    }
    return cities;
  }

  Future<int> getNumber() async {
    Database dbCity = await db;
    return Sqflite.firstIntValue(
        await dbCity.rawQuery("SELECT COUNT(*) FROM $citiesTable"));
  }

  Future close() async {
    Database dbCity = await db;
    dbCity.close();
  }
}
