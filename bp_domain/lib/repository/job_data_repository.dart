import 'package:bp_domain/error/graph_error.dart';
import 'package:bp_domain/model/job.dart';
import 'package:dartz/dartz.dart';

abstract class JobDataRepository {
  Future<Either<GraphError, List<Job>>> getJobList();
}
