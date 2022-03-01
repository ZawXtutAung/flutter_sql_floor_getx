import 'package:floor/floor.dart';
import 'package:flutter_sql_floor/database/database_dao.dart';
import 'package:flutter_sql_floor/database/database_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'my_database.g.dart';

@Database(version: 1, entities: [MyDBTable])
abstract class MyDatabase extends FloorDatabase {
  MyDatabaseDao get dbdao;
}
