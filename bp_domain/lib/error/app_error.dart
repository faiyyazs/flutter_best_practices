import 'package:bp_domain/constants/enum.dart';
import 'package:bp_domain/model/error_info.dart';
import 'package:flutter/foundation.dart';
import 'base_error.dart';

class AppError extends BaseError {
  AppErrorEnums errorType;

  AppError({
    @required String message,
    Exception throwable,
    error: ErrorInfo,
    this.errorType,
  }) : super(message, error: error, cause: throwable);

  @override
  String getFriendlyMessage() {
    throw "$message";
  }
}
