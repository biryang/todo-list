import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_list_app/models/task_model.dart';

// final String tableName = 'tasks';

class DatabaseHelper {
  var _db;

  String tableName = 'todo_table';
  String colId = 'id';
  String colText = 'text';
  String colTag = 'tag';
  String colDone = 'done';
  String colTime = 'time';

  //DB 조회
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      //DB 경로 지정 : path 패키지의 join 함수 사용
      join(await getDatabasesPath(), 'task_list.db'),
      onCreate: (db, version) {
        // 데이터베이스에 CREATE TABLE 수행
        return db.execute(
          """
            CREATE TABLE $tableName(
              $colId INTEGER PRIMARY KEY, 
              $colText TEXT, 
              $colTag TEXT, 
              $colDone TEXT, 
              $colTime TEXT
            )
          """,
        );
      },
      //. onCreate 함수에서  DB 업그레이드 / 다운그레이드를 수행하기 위한 경로 제공
      version: 1,
    );
    return _db;
  }

  //Task 등록
  Future<void> insertTask(TaskModel task) async {
    final Database db = await database;

    await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TaskModel>> getTasks() async {
    final Database db = await database;
    final List<Map<dynamic, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return TaskModel(
        id: maps[i][colId],
        text: maps[i][colText],
        tag: maps[i][colTag],
        done: maps[i][colDone],
        time: maps[i][colTime],
      );
    });
  }

  Future<List> getTag() async {
    final Database db = await database;
    List tag = await db.rawQuery("select distinct $colTag from $tableName");

    return tag;
  }

  Future<void> updateTask(TaskModel task) async {
    final Database db = await database;

    await db.update(
      tableName,
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void>  showTable() async {
    final db = await database;

    List result = await db.rawQuery("SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'android_%'");
    print('show');
    print(result);
  }

  Future<void> readTable() async {
    final db = await database;
    dynamic result = await db.rawQuery("SELECT sql FROM sqlite_master WHERE tbl_name='$tableName'");
    print(result);
  }

  Future<void> dropTable() async {
    final db = await database;
    dynamic result = await db.rawQuery("DROP TABLE IF EXISTS '$tableName'");
    print(result);
  }

  Future<void> addTable() async {
    final db = await database;
    dynamic result = await db.rawQuery("""
            CREATE TABLE $tableName(
              $colId INTEGER PRIMARY KEY AUTOINCREMENT, 
              $colText TEXT, 
              $colTag TEXT, 
              $colDone TEXT, 
              $colTime TEXT
            )
          """);
    print(result);
  }
}
