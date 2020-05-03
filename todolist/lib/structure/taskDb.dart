import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/structure/task.dart';

final String taskTable = "taskTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String completedColumn = "completedColumn";
final String priorityColumn = "priorityColumn";
final String descriptionColumn = "descriptionColumn";

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
    final path = join(databasesPath, "tasksnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $taskTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $descriptionColumn TEXT,"
          "$priorityColumn TEXT, $completedColumn TEXT);");
    });
  }

  Future<Task> saveTask(Task task) async {
    Database dbTask = await db;
    task.id = await dbTask.insert(taskTable, task.toMap());
    return task;
  }

  Future<Task> getTask(int id) async {
    Database dbTask = await db;
    List<Map> maps = await dbTask.query(taskTable,
        columns: [
          idColumn,
          nameColumn,
          completedColumn,
          descriptionColumn,
          priorityColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteTask(int id) async {
    Database dbTask = await db;
    return await dbTask
        .delete(taskTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateTask(Task task) async {
    Database dbTask = await db;
    return await dbTask.update(taskTable, task.toMap(),
        where: "$idColumn = ?", whereArgs: [task.id]);
  }

  Future<List> getAllTask() async {
    Database dbTask = await db;
    List listMap = await dbTask.rawQuery("SELECT * FROM $taskTable");
    List<Task> listTask = List();
    for (Map m in listMap) {
      listTask.add(Task.fromMap(m));
    }
    return listTask;
  }

  Future<int> getNumber() async {
    Database dbTask = await db;
    return Sqflite.firstIntValue(
        await dbTask.rawQuery("SELECT COUNT(*) FROM $taskTable"));
  }

  Future close() async {
    Database dbTask = await db;
    dbTask.close();
  }
}
