// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphError _$GraphErrorFromJson(Map<String, dynamic> json) {
  return GraphError(
    error: json['error'] as bool,
    errorCode: json['errorCode'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$GraphErrorToJson(GraphError instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'error': instance.error,
      'message': instance.message,
    };
