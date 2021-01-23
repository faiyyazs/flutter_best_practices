import 'package:bp_data/network/api/graphql/graphql_service.dart';
import 'package:bp_data/network/api/graphql/job_service.dart';
import 'package:bp_data/network/api/rest/api_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class ApiProperties {
  static const String BASE_URL =
      "https://dev.farizdotid.com/api"; //BuildConfig.BASE_URL;
}

final baseOptions = Provider<BaseOptions>(
    (ref) => BaseOptions(baseUrl: ApiProperties.BASE_URL));

final dioProvider = Provider<Dio>(
  (ref) => Dio(ref.read(baseOptions)),
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioProvider)),
);

final graphServiceProvider = Provider<GraphQLService>(
  (ref) => GraphQLService(),
);

final jobServiceProvider = Provider<JobService>(
  (ref) => JobService(
    ref.read(graphServiceProvider),
  ),
);
