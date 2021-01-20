import 'package:bp_data/db/dao/base/base_dao.dart';
import 'package:bp_data/entity/local/province_db_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProvinceDao extends BaseDao<ProvinceDBEntity> {
  @Query("SELECT * FROM province")
  Future<List<ProvinceDBEntity>> getProvinces();
}
