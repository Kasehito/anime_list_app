import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:anime_list_app/model/anime_model.dart';

class WatchlistController extends GetxController {
  static Database? _db;
  var data = <AnimeModel>[].obs;

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'watchlist_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE watchlist(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT, 
            description TEXT,
            imageUrl TEXT,
            genre TEXT,
            date TEXT,
            rating REAL,
            isAdded INTEGER
          )
        ''');
      },
    );
  }

  Future<int> addTask(AnimeModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('watchlist', task.toMap());
    loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('watchlist');
    data.assignAll(
        queryResult.map((data) => AnimeModel.fromMap(data)).toList());
  }

  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('watchlist', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}
