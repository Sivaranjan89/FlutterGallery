import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter_gallery/datatable/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  static Database _database;

  static final _databaseName = "FGDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'user_details';

  static final columnId = '_id';
  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';
  static final columnAge = 'age';

  // make this a singleton class
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Null> openMyDatabase() async {
    //Get Path for Database
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, _databaseName);

    //Create/Open Database
    var database = await openDatabase(dbPath, version: _databaseVersion, onCreate: _onCreate);
    _database = database;

    return null;
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )''');
  }

  //Insert Data
  insert(User row) async {
    await _database.insert(table, row.toMap());
  }

  //Get the list of all Users saved
  Future<List<User>> getUsers() async {
    List<Map> users = await _database.query(table);
    return User.fromList(users);
  }

  //Get the total number of Rows
  Future<int> getRowCount() async {
    List<Map> data = await _database.query(table);
    return data.length;
  }

  //Update a row
  Future<int> update(User row, int pos) async {
    return await _database.update(table, row.toMap(), where: '$columnId = ?', whereArgs: [pos]);
  }

  //Delete a row
  Future<int> delete(int pos) async {
    return await _database.delete(table, where: '$columnId = ?', whereArgs: [pos]);
  }
}