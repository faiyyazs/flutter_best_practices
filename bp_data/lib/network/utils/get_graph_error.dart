import 'package:bp_domain/error/graph_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';

Either<GraphError, T> getGraphError<T>({QueryResult apiResponse}) {
  if (apiResponse.data != null) {
    try {
      return Left(
        GraphError(
            error: ErrorInfo(
                message:
                    'Connection to API server failed due to internet connection'),
            message: apiResponse.exception.clientException.message,
            errorCode: ""),
      );
    } catch (exception) {
      exception.printStackTrace();
      return Left(
        GraphError(
          error: ErrorInfo(
              message:
                  'Connection to API server failed due to internet connection'),
          errorCode: "",
          message: exception.toString(),
        ),
      );
    }
  } else {
    return Left(
      GraphError(
          error: ErrorInfo(
              message:
                  'Connection to API server failed due to internet connection'),
          errorCode: "",
          message: ""),
    );
  }
}
