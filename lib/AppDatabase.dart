// database.dart

// required package imports
import 'dart:async';
import 'package:efg_day5_floor/model/Person.dart';
import 'package:efg_day5_floor/model/PersonDao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'AppDatabase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}