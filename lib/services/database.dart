import 'package:SmartMoodle/models/DatabaseActivityModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  DatabaseServices._();

  static final DatabaseServices db = DatabaseServices._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database =
          await openDatabase(join(await getDatabasesPath(), 'database.db'),
              onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE activities(id INTEGER PRIMARY KEY, title TEXT NOT NULL, coursename TEXT NOT NULL, priority INTEGER, timestart INTEGER)",
        );
      }, version: 1);
      return _database;
    }
  }

  insertActivity(DataBaseActitivyModel activity) async {
    print("Database/insertActivity -> " + activity.toMap().toString());
    final db = await database;
    await db.insert('activities', activity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    List<DataBaseActitivyModel> getAll = await getAllActivities();
    print("Database/insertActivity/success -> " + getAll.toString());
  }

  Future<List<DataBaseActitivyModel>> getAllActivities() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('activities');
    return List.generate(maps.length, (i) {
      return DataBaseActitivyModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        coursename: maps[i]['coursename'],
        priority: maps[i]['priority'],
        timestart: maps[i]['timestart'],
      );
    });
  }

  updateActivity(DataBaseActitivyModel activity) async {
    final db = await database;
    await db.update('activities', activity.toMap(),
        where: 'id == ?', whereArgs: [activity.id]);
  }

  deleteActivity(int id) async {
    final db = await database;
    await db.delete('activities', where: 'id == ?', whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from activities");
  }
}
