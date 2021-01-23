import 'package:bp_data/entity/remote/response/graphql/graphql_response.dart';
import 'package:bp_data/entity/remote/response/graphql/job/job_response_entity.dart';
import 'package:bp_data/network/api/graphql/job_service.dart';
import 'package:bp_data/source/job/job_repository_datasources.dart';

class JobRemoteRepositoryDataSourceImpl implements JobRemoteRepoDataStore {
  final JobService _jobService;

  JobRemoteRepositoryDataSourceImpl(this._jobService);

  @override
  Future<GraphQLResponse<JobResponseEntity>> getJobs() {
    return _jobService.getJobs();
  }
}
