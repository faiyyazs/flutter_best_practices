import 'package:bp_data/entity/local/province_db_entity.dart';
import 'package:bp_data/entity/remote/response/province_response_entity.dart';
import 'package:bp_data/network/utils/safe_api_call.dart';
import 'package:bp_data/source/province/province_repository_datasources.dart';
import 'package:bp_domain/error/database_error.dart';
import 'package:bp_domain/error/network_error.dart';
import 'package:bp_domain/model/province.dart';
import 'package:bp_domain/repository/provice_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:retrofit/retrofit.dart';

class ProvinceDataRepositoryImpl extends ProvinceDataRepository {
  final ProvinceRemoteRepoDataStore _provinceRemoteRepoDataStore;
  final ProvinceLocalRepoDataStore _provinceLocalRepoDataStore;

  ProvinceDataRepositoryImpl(
      this._provinceRemoteRepoDataStore, this._provinceLocalRepoDataStore);

  @override
  Future<Either<NetworkError, List<Province>>> getRemoteProvinceList() async {
    final response = await safeApiCall<HttpResponse<ProvinceResponseEntity>>(
        _provinceRemoteRepoDataStore.getProvinces());
    return response?.fold(
        (left) => Left(left), (r) => Right(r.data.transform()));
  }

  @override
  Future<Either<DatabaseError, List<Province>>> saveProvinceList(
      List<Province> data) async {
    try {
      await _provinceLocalRepoDataStore.insertAll(
          data.map((e) => ProvinceDBEntity(name: e.name, id: e.id)).toList());
    } catch (e) {
      return Left(DatabaseError(message: 'Something is wrong'));
    }
    return Right(data);
  }
}
