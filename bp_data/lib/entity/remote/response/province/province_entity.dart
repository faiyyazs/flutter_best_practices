import 'package:bp_domain/model/province.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province_entity.g.dart';

@JsonSerializable()
class ProvinceEntity with BaseLayerDataTransformer<ProvinceEntity,Province> {
  final int id;

  @JsonKey(name: "nama")
  final String name;

  ProvinceEntity({this.id, this.name});

  factory ProvinceEntity.fromJson(Map<String, dynamic> json) =>
      _$ProvinceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceEntityToJson(this);

  @override
  Province transform() {
    return Province(
      id: id,
      name: name
    );
  }

}
