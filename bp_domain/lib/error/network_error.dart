import 'package:bp_domain/constants/enum.dart';
import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:flutter/widgets.dart';

import 'base_error.dart';

class NetworkError extends BaseError
    with BaseLayerDataTransformer<NetworkError, AppError> {
  NetworkError({
    @required String message,
    @required int httpError,
    ErrorInfo error,
  }) : super(message, error: error);

  @override
  String getFriendlyMessage() {
    throw "$message";
  }

  @override
  AppError transform() {
    switch (error?.code) {
      case 503:
        return AppError(
            message: error.message,
            error: error,
            errorType: AppErrorEnums.NO_INTERNET_CONNECTION);

      case 504:
        return AppError(
            message: "", error: error, errorType: AppErrorEnums.INVALID_TEST);

      case 502:
        return AppError(
            message: "", error: error, errorType: AppErrorEnums.INVALID_TEST);

      default:
        return AppError(
          message: "",
          error: error,
        );
    }
  }
}
