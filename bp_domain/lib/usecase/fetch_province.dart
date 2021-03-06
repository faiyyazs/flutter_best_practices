import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/error/network_error.dart';
import 'package:bp_domain/model/province.dart';
import 'package:bp_domain/repository/provice_data_repository.dart';
import 'package:dartz/dartz.dart';

import 'base/base_usecase.dart';
import 'base/params.dart';

class FetchProvinceUseCase
    extends BaseUseCase<FetchProvinceParams, List<Province>> {
  final ProvinceDataRepository _provinceRepository;

  FetchProvinceUseCase(this._provinceRepository);

  @override
  Future<Either<NetworkError, List<Province>>> execute(
      {FetchProvinceParams params}) async {
    return Future.value((await _provinceRepository.getRemoteProvinceList())
        .fold((l) => Left(l), (r) => Right(r)));
  }
}

class FetchProvinceParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
