import 'package:bp_domain/constants/enum.dart';
import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:flutter/widgets.dart';

import 'base_error.dart';

class DatabaseError extends BaseError {
  DatabaseError({
    @required String message,
    ErrorInfo error,
  }) : super(message, error: error);

  @override
  String getFriendlyMessage() {
    throw "$message";
  }

  @override
  AppError transform() {
    switch (error?.code) {
      case 1:
        return AppError(
            message: error.message,
            error: error,
            errorType: AppErrorEnums.DB_ERROR);

      default:
        return AppError(
          message: "",
          error: error,
        );
    }
  }
}
