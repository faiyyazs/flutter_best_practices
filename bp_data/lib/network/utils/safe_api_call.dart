import 'dart:io';

import 'package:bp_domain/error/network_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_error.dart';
import 'package:retrofit/retrofit.dart';

import 'get_error.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      getError<T>(apiResponse: eitherResponse);
    } else {
      print("original response $originalResponse");
      return Right(originalResponse);
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
            return Left(NetworkError(
                message:
                    "Connection to API server failed due to internet connection",
                httpError: 503,
                error: ErrorInfo(
                    code: 503,
                    message:
                        "Connection to API server failed due to internet connection")));
        }

        break;

      case IOException:
        return Left(NetworkError(
            message: throwable.toString(),
            httpError: 502,
            error: ErrorInfo(code: 502)));

      case HttpException:
        var code = throwable.code();
        return Left(NetworkError(
            message: (throwable as HttpException).message,
            httpError: code,
            error: ErrorInfo(code: code)));

      default:
        return Left(NetworkError(
            message: throwable.toString(),
            httpError: 502,
            error: ErrorInfo(code: 502, message: throwable.toString())));
    }
  }
}

extension RetrofitResponse on HttpResponse {
  /**
   * Returns true if the code is in [200..300), which means the request was successfully received,
   * understood, and accepted.
   */
  bool isSuccessful() {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
