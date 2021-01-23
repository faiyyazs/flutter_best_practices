// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponseEntity _$JobResponseEntityFromJson(Map<String, dynamic> json) {
  return JobResponseEntity(
    errorCode: json['errorCode'] ?? '',
    error: json['error'] ?? false,
    message: json['message'] ?? '',
    jobs: (json['jobs'] as List)
        ?.map((e) =>
            e == null ? null : JobEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..data = json['data'] == null
      ? null
      : JobResponseEntity.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$JobResponseEntityToJson(JobResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  val['data'] = instance.data;
  val['jobs'] = instance.jobs;
  return val;
}
