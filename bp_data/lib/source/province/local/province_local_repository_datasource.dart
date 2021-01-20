import 'package:bp_data/db/floor_db_service.dart';
import 'package:bp_data/entity/local/province_db_entity.dart';

import '../province_repository_datasources.dart';

class ProvinceLocalRepositoryDataSourceImpl
    implements ProvinceLocalRepoDataStore {
  final FloorDbService _database;

  ProvinceLocalRepositoryDataSourceImpl(this._database);

  @override
  Future<List<ProvinceDBEntity>> getProvinces() async {
    return (await _database.db).provinceDao.getProvinces();
  }

  @override
  Future<bool> insertAll(List<ProvinceDBEntity> list) async {
    return (await (await _database.db).provinceDao.insertDataList(list))
            .length >
        0;
  }
}
