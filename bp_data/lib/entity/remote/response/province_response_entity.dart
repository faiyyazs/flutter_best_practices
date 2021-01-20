import 'package:bp_data/entity/remote/response/province/province_entity.dart';
import 'package:bp_domain/model/province.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province_response_entity.g.dart';

@JsonSerializable()
class ProvinceResponseEntity
    with BaseLayerDataTransformer<ProvinceResponseEntity, List<Province>> {
  @JsonKey(name: 'error', defaultValue: false, includeIfNull: false)
  bool error;

  @JsonKey(name: 'message', defaultValue: "", includeIfNull: false)
  String message;

  @JsonKey(name: 'provinsi')
  List<ProvinceEntity> provinces;

  ProvinceResponseEntity({this.provinces, this.error: false, this.message: ""});

  factory ProvinceResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseEntityToJson(this);

  List<Province> transform() {
    return this.provinces.map((e) => e.transform()).toList();
  }
}
