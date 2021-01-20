import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/error/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'params.dart';

abstract class BaseUseCase<P extends Params, T> {
  Future<Either<AppError, T>> verifyAndExecute({@required P params}) {
    return _build(params: params);
  }

  Future<Either<AppError, T>> _build({@required P params}) {
    return Future.value(params.verify().fold(
        (l) => Left(l),
        (r) async => (await execute(params: params)).fold((l) {
              return Left(l.transform());
            }, (result) => Right(result))));
  }

  Future<Either<NetworkError, T>> execute({@required P params});
}
