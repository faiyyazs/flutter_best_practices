import 'dart:io';

import 'package:bp_data/entity/remote/response/graphql/graphql_response.dart';
import 'package:bp_data/network/utils/get_graph_error.dart';
import 'package:bp_domain/error/graph_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_error.dart';

Future<Either<GraphError, T>> safeGqlCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as GraphQLResponse<dynamic>;
    if (eitherResponse.queryResult.hasException) {
      return getGraphError(apiResponse: eitherResponse.queryResult);
    } else {
      if (eitherResponse.data.error) {
        return Left(
          GraphError(
              error: ErrorInfo(message: eitherResponse.data.message),
              graphErrorCode: eitherResponse.data.errorCode,
              message: eitherResponse.data.message),
        );
      } else {
        return Right(originalResponse);
      }
    }
  } catch (throwable) {
    print("Network error: ${throwable}");
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable).type) {
          case DioErrorType.CONNECT_TIMEOUT:
            //"Connection timeout with API server";
            break;
          case DioErrorType.SEND_TIMEOUT:
            //"Receive timeout exception";
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            //"Receive timeout in connection with API server";
            break;
          case DioErrorType.RESPONSE:
            //"Received invalid status code: ${error.response.statusCode}";
            break;
          case DioErrorType.CANCEL:
            //"Request to API server was cancelled"
            break;
          case DioErrorType.DEFAULT:
            return Left(
              GraphError(
                message:
                    "Connection to API server failed due to internet connection",
                error: ErrorInfo(
                    message:
                        'Connection to API server failed due to internet connection'),
              ),
            );
        }

        break;

      case IOException:
        return Left(
          GraphError(
            message: throwable.toString(),
            error: ErrorInfo(
                message:
                    'Connection to API server failed due to internet connection'),
          ),
        );

      case HttpException:
        var code = throwable.code();
        return Left(
          GraphError(
            message: (throwable as HttpException).message,
            error: ErrorInfo(
                message:
                    'Connection to API server failed due to internet connection'),
          ),
        );

      default:
        return Left(
          GraphError(
            message: throwable.toString(),
            error: ErrorInfo(
                message:
                    'Connection to API server failed due to internet connection'),
          ),
        );
    }
  }
}
