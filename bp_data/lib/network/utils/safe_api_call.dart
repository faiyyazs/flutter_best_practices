import 'dart:io';

import 'package:bp_domain/error/network_error.dart';
import 'package:dartz/dartz.dart';
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
    print("throwable $throwable");
    switch (throwable) {
      case IOException:
        return Left(
            NetworkError(message: throwable.toString(), httpError: 502));

      case HttpException:
        var code = throwable.code();
        return Left(NetworkError(
            message: (throwable as HttpException).message, httpError: code));

      default:
        return Left(
            NetworkError(message: throwable.toString(), httpError: 502));
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
