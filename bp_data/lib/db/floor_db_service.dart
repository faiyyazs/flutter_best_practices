import 'dart:async';

import 'package:bp_data/db/app_database.dart';
import 'package:floor/floor.dart';

class FloorDbService {
  static final FloorDbService connect = FloorDbService._internal();

  FloorDbService._internal();

  static Callback callback;
  static String dbName;

  factory FloorDbService(Callback dbCallBack, String databaseName) {
    callback = callback;
    dbName = databaseName;
    return connect;
  }

  static AppDatabase _database;

  Future<AppDatabase> get db async {
    if (_database == null) {
      _database = await _initializeDatabase();
    }
    return _database;
  }

  Future<AppDatabase> _initializeDatabase() async {
    return await $FloorAppDatabase
        .databaseBuilder(dbName)
        .addCallback(callback)
        .build();
  }
}
