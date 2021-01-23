import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/error/graph_error.dart';
import 'package:bp_domain/model/job.dart';
import 'package:bp_domain/repository/job_data_repository.dart';
import 'package:dartz/dartz.dart';

import 'base/base_usecase.dart';
import 'base/params.dart';

class FetchJobUseCase extends BaseUseCase<FetchJobParams, List<Job>> {
  final JobDataRepository _jobDataRepository;

  FetchJobUseCase(this._jobDataRepository);

  @override
  Future<Either<GraphError, List<Job>>> execute({FetchJobParams params}) async {
    return Future.value(
      (await _jobDataRepository.getJobList()).fold(
        (l) => Left(l),
        (r) => Right(r),
      ),
    );
  }
}

class FetchJobParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
