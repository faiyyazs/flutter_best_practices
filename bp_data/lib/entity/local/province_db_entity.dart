import 'package:bp_domain/model/province.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "province")
class ProvinceDBEntity
    extends BaseLayerDataTransformer<ProvinceDBEntity, Province> {
  @primaryKey
  final int id;
  final String name;

  ProvinceDBEntity({this.id, this.name = ""});

  @override
  transform() {
    return Province(id: id, name: name);
  }

  @override
  restore(data) {
    return ProvinceDBEntity(id: data.id, name: data.name);
  }
}

