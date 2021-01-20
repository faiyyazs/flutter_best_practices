import 'package:bp_domain/error/database_error.dart';
import 'package:bp_domain/error/network_error.dart';
import 'package:bp_domain/model/province.dart';
import 'package:dartz/dartz.dart';

abstract class ProvinceDataRepository {
  Future<Either<NetworkError, List<Province>>> getRemoteProvinceList();
  Future<Either<DatabaseError, List<Province>>> saveProvinceList(List<Province> data);
}
