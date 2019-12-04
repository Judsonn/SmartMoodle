import 'package:sqflite/sqflite.dart';

final String tableActivity = 'activity';
final String columnId = '_id';
final String columnName = 'name';
final String columnDifficulty = 'difficulty';
final String columnWeight = 'weight';
final String columnKnowledge = 'knowledge';
final String columnHours = 'hours';

class Activity {
  int id;
  String name;
  num difficulty;
  num weight;
  num knowledge;
  num hours;

  int get act_id {
    return id;
  }

  void set act_id(int id) {
    this.id = id;
  }

  String get act_name {
    return name;
  }

  void set act_name(String name) {
    this.name = name;
  }

  num get act_difficulty {
    return difficulty;
  }

  void set act_difficulty(num difficulty) {
    this.difficulty = difficulty;
  }

  num get act_weight {
    return weight;
  }

  void set act_weight(num weight) {
    this.weight = weight;
  }

  num get act_knowledge {
    return knowledge;
  }

  void set act_knowledge(num knowledge) {
    this.knowledge = knowledge;
  }

  num get act_hours {
    return hours;
  }

  void set act_hours(num hours) {
    this.hours = hours;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnDifficulty: difficulty,
      columnWeight: weight,
      columnKnowledge: knowledge,
      columnHours: hours
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Activity();

  Activity.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    difficulty = map[columnDifficulty];
    weight = map[columnWeight];
    knowledge = map[columnKnowledge];
    hours = map[columnHours];
  }

  num calcPriority(num difficulty, num weight, num knowledge, num hours) {
    num priority = ((knowledge * 0.01) / difficulty) * weight;
    priority = priority * hours;
    return priority;
  }
}

// main(num difficulty, num weight, num knowledge, num hours) {
//   Activity act = new Activity();
//   num priori = act.calc_priority(difficulty, weight, knowledge, hours);
//   print(priori);
// }

class ActivityProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableActivity ( 
  $columnId integer primary key autoincrement, 
  $columnName text not null,
  $columnDifficulty integer not null,
  $columnWeight double not null,
  $columnKnowledge integer not null,
  $columnHours integer not null)
''');
    });
    print(db);
  }

  Future<Activity> insert(Activity acti) async {
    acti.id = await db.insert(tableActivity, acti.toMap());
    return acti;
  }

  Future<int> count() async {
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM activity;'));
    return count;
  }
  
  Future<List<Map>> getAllActivities() async {

    List<Map> list = await db.rawQuery('SELECT * FROM activity');
    return list;
  }

  Future<Activity> getActivity(int id) async {
    List<Map> maps = await db.query(tableActivity,
        columns: [columnId, columnName, columnDifficulty, columnWeight, columnKnowledge, columnHours],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Activity.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableActivity, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Activity todo) async {
    return await db.update(tableActivity, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
