import 'package:bp_domain/constants/enum.dart';
import 'package:bp_domain/error/app_error.dart';
import 'package:bp_domain/error/base_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_error.g.dart';

@JsonSerializable()
class GraphError extends BaseError {
  String graphErrorCode;
  String errorCode;

  GraphError({this.graphErrorCode, this.errorCode, message, error})
      : super(message, error: error);

  factory GraphError.fromJson(Map<String, dynamic> json) =>
      _$GraphErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GraphErrorToJson(this);

  @override
  AppError transform() {
    switch (graphErrorCode) {
      case "JOB_NOT_FOUND":
        return AppError(
            message: error.message,
            error: error,
            errorType: AppErrorEnums.JOB_NOT_FOUND);
    }
    return AppError(
        message: error.message,
        error: error,
        errorType: AppErrorEnums.INVALID_TEST);
  }

  @override
  String getFriendlyMessage() {
    return "";
  }
}
