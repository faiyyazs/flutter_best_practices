import 'package:bp_data/entity/remote/response/graphql/graphql_response.dart';
import 'package:bp_data/entity/remote/response/graphql/job/job_response_entity.dart';
import 'package:bp_data/network/utils/safe_gql_call.dart';
import 'package:bp_data/source/job/job_repository_datasources.dart';
import 'package:bp_domain/error/graph_error.dart';
import 'package:bp_domain/model/job.dart';
import 'package:bp_domain/repository/job_data_repository.dart';
import 'package:dartz/dartz.dart';

class JobDataRepositoryImpl extends JobDataRepository {
  final JobRemoteRepoDataStore _jobRemoteRepoDataStore;

  JobDataRepositoryImpl(
    this._jobRemoteRepoDataStore,
  );

  @override
  Future<Either<GraphError, List<Job>>> getJobList() async {
    final response = await safeGqlCall<GraphQLResponse<JobResponseEntity>>(
        _jobRemoteRepoDataStore.getJobs());
    return response?.fold(
      (left) => Left(left),
      (r) => Right(
       r.data.transform(),
      ),
    );
  }
}
