import 'package:anime_list_app/model/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  //create object variable yang diperlukan
  static final DatabaseHelper _instance = DatabaseHelper._instance;

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'task.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, imageUrl TEXT, genre TEXT, rating REAL)');
    });
  }

  Future<int> insertTask(TaskModel taskModel) async {
    final db = await database;
    return await db.insert('task', taskModel.toMap());
  }

  Future<List<TaskModel>> getTaskList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('task');
    return List.generate(maps.length, (index) {
      return TaskModel.fromMap(maps[index]);
    });
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('task', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTask(TaskModel taskModel) async {
    final db = await database;
    return await db.update('task', taskModel.toMap(),
        where: 'id = ?', whereArgs: [taskModel.id]);
  }
}
