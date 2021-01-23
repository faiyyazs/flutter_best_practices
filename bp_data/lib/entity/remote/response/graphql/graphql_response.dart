import 'package:bp_data/entity/remote/response/graphql/job/job_response_entity.dart';
import 'package:graphql/client.dart';

class GraphQLResponse<T extends BaseGraphResponseEntity> {
  QueryResult queryResult;
  BaseGraphResponseEntity data;

  GraphQLResponse({this.data, this.queryResult});
}