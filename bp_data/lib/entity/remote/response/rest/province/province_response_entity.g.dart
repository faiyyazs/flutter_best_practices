// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceResponseEntity _$ProvinceResponseEntityFromJson(
    Map<String, dynamic> json) {
  return ProvinceResponseEntity(
    provinces: (json['provinsi'] as List)
        ?.map((e) => e == null
            ? null
            : ProvinceEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: json['error'] as bool ?? false,
    message: json['message'] as String ?? '',
  );
}

Map<String, dynamic> _$ProvinceResponseEntityToJson(
    ProvinceResponseEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  val['provinsi'] = instance.provinces;
  return val;
}
