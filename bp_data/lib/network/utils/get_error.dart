import 'package:bp_data/entity/remote/error/error_response_entity.dart';
import 'package:bp_domain/error/network_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:dartz/dartz.dart';
import 'package:retrofit/retrofit.dart';

Either<NetworkError, T> getError<T>({HttpResponse<T> apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final errorResponseEntity = ErrorResponseEntity.fromJson(
          apiResponse.data as Map<String, dynamic>);
      if (errorResponseEntity != null) {
        return Left(NetworkError(
            httpError: apiResponse.response.statusCode,
            message: errorResponseEntity.error.message,
            error: ErrorInfo(code: apiResponse.response.statusCode)));
      } else {
        return Left(NetworkError(
            httpError: apiResponse.response.statusCode,
            error: ErrorInfo(code: apiResponse.response.statusCode),
            message: apiResponse.response.statusMessage));
      }
    } catch (exception) {
      exception.printStackTrace();
      return Left(NetworkError(
          error: ErrorInfo(code: apiResponse.response.statusCode),
          httpError: apiResponse.response.statusCode,
          message: apiResponse.response.statusMessage));
    }
  } else {
    return Left(NetworkError(
        error: ErrorInfo(code: apiResponse.response.statusCode),
        httpError: apiResponse.response.statusCode,
        message: apiResponse.response.statusMessage));
  }
}
