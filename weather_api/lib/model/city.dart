final String citiesTable = "citiesTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String countryColumn = "countryColumn";

class City {
  String name;
  String country;
  int id;

  City(this.name, this.country);

  City.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    country = map[countryColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      countryColumn: country,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}
