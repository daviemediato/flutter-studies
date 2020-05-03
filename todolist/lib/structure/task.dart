final String taskTable = "taskTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String completedColumn = "completedColumn";
final String priorityColumn = "priorityColumn";
final String descriptionColumn = "descriptionColumn";

class Task {
  String name;
  bool completed;
  String priority;
  String description;
  int id;

  Task(this.name, this.completed, this.priority, this.description);

  Task.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    if (map[completedColumn] == "true")
      completed = true;
    else
      completed = false;
    priority = map[priorityColumn];
    description = map[descriptionColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      priorityColumn: priority,
      descriptionColumn: description
    };
    if (completed)
      map[completedColumn] = "true";
    else
      map[completedColumn] = "false";
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}
