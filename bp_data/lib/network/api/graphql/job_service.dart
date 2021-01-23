import 'package:bp_data/entity/remote/response/graphql/graphql_response.dart';
import 'package:bp_data/entity/remote/response/graphql/job/job_response_entity.dart';
import 'package:bp_data/network/api/graphql/graphql_endpoint.dart';
import 'package:bp_data/network/api/graphql/graphql_service.dart';
import 'package:graphql/client.dart';

class JobService {
  final GraphQLService graphQLService;

  JobService(this.graphQLService);

  Future<GraphQLResponse<JobResponseEntity>> getJobs() async {
    QueryResult queryResult = await graphQLService.execute(
      type: GraphQLService.QUERY,
      query: GET_JOBS,
      variables: Map<String, dynamic>(),
    );

    Map<String, dynamic> result = queryResult.data as Map<String, dynamic>;

    return GraphQLResponse(
        data: JobResponseEntity.fromJson(result), queryResult: queryResult);
  }
}
