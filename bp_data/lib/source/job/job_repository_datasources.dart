import 'package:bp_data/entity/remote/response/graphql/graphql_response.dart';
import 'package:bp_data/entity/remote/response/graphql/job/job_response_entity.dart';

abstract class JobRemoteRepoDataStore {
  Future<GraphQLResponse<JobResponseEntity>> getJobs();
}
