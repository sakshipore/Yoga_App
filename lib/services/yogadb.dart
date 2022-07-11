import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yoga_app/model/model.dart';

class YogaDatabase {
  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;
  YogaDatabase._init();

  //Initialise db method
  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB("YogaStepsDB.db");
    return _database;
  }

  //id, bool(seconds), text
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
      CREATE TABLE ${YogaModel.YogaTable1} (
        ${YogaModel.IDName} $idType,
        ${YogaModel.YogaName} $textType,
        ${YogaModel.ImageName} $textType,
        ${YogaModel.SecondsOrNot} $boolType
      )
    ''');

    await db.execute('''
      CREATE TABLE ${YogaModel.YogaTable2} (
        ${YogaModel.IDName} $idType,
        ${YogaModel.YogaName} $textType,
        ${YogaModel.ImageName} $textType,
        ${YogaModel.SecondsOrNot} $boolType
      )
    ''');

    await db.execute('''
      CREATE TABLE ${YogaModel.YogaTable3} (
        ${YogaModel.IDName} $idType,
        ${YogaModel.YogaName} $textType,
        ${YogaModel.ImageName} $textType,
        ${YogaModel.SecondsOrNot} $boolType
      )
    ''');

    await db.execute('''
      CREATE TABLE ${YogaModel.YogaSummary} (
        ${YogaModel.IDName} $idType,
        ${YogaModel.YogaWorkOutName} $textType,
        ${YogaModel.BackImg} $textType,
        ${YogaModel.TimeTaken} $textType,
        ${YogaModel.TotalNoOfWork} $textType
      )
    ''');
  }

  //insert yoga method
  Future<Yoga?> Insert(Yoga yoga, String TableName) async {
    final db = await instance.database;
    final id = await db!.insert(TableName, yoga.toJson());
    return yoga.copy(id: id);
  }

  //insert yoga summary method
  Future<YogaSummary?> InsertYogaSum(YogaSummary yogasum) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaSummary, yogasum.toJson());
    return yogasum.copy(id: id);
  }

  //list of yoga
  Future<List<Yoga>> readAllYoga(String TableName) async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final query_res = await db!.query(TableName, orderBy: orderBy);
    return query_res.map((json) => Yoga.fromJson(json)).toList();
  }

  //list of yoga summary
  Future<List<YogaSummary>> readAllYogaSummary() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final query_res = await db!.query(YogaModel.YogaSummary, orderBy: orderBy);
    return query_res.map((json) => YogaSummary.fromJson(json)).toList();
  }

  //read one at a time
  Future<Yoga?> readOneYoga(int id, String TableName) async {
    final db = await instance.database;
    final map = await db!.query(TableName,
        columns: YogaModel.YogaTable1ColumnName,
        where: '${YogaModel.IDName}=?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Yoga.fromJson(map.first);
    } else {
      return null;
    }
  }
}
