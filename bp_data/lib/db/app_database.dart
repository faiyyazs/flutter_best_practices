import 'package:bp_data/entity/local/province_db_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/province_dao.dart';
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1,entities: [ProvinceDBEntity])
abstract class AppDatabase extends FloorDatabase {
  ProvinceDao get provinceDao;
}
