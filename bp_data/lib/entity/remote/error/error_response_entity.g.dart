// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) {
  return ErrorResponseEntity(
    json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ErrorResponseEntityToJson(
        ErrorResponseEntity instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
