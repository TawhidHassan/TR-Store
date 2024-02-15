import 'dart:async';
import 'dart:io' as io;
import 'package:TrStore/data/Local/ProductLocal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  static Database? _db;

  Future<Database> get db async {
    if(_db != null)
      return _db!;
    _db = await initDb();
    return _db!;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE ProductLocal(id INTEGER PRIMARY KEY, title TEXT, image TEXT, userId INTEGER )");
    print("Created tables");
  }

  // Retrieving employees from Employee Tables



  Future<List<ProductLocal>?> fetchAllProducts() async {
    Database database = await db;
    List<Map<String, dynamic>> maps = await database.query('ProductLocal');
    if (maps.isNotEmpty) {
      return maps.map((map) => ProductLocal.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<int> addProduct(ProductLocal productLocal) async {
    Database database = await db;
    return database.insert(
      'ProductLocal',
      productLocal.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateProduct(ProductLocal productLocal) async {
    Database database = await db;
    return database.update(
      'ProductLocal',
      productLocal.toDbMap(),
      where: 'id = ?',
      whereArgs: [productLocal.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteProduct(int id) async {
    Database database = await db;
    return database.delete(
      'ProductLocal',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}