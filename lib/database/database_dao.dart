import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sql_floor/database/database_table.dart';

@dao
abstract class MyDatabaseDao {
  //late  MyDBTable mydbTable=MyDBTable(name, job);
  @Query('SELECT * FROM mydb')
  Stream<List<MyDBTable>> getAlldb();
  @insert
  Future<void> addDb(MyDBTable myDBTable);
  @delete
  Future<void> delData(MyDBTable myDBTable);
  @update
  Future<void> updateData(MyDBTable myDBTable);
}
