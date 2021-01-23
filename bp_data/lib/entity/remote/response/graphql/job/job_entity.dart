import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bp_domain/model/job.dart';

part 'job_entity.g.dart';

@JsonSerializable()
class JobEntity with BaseLayerDataTransformer<JobEntity, Job> {
  final String id;

  @JsonKey(name: "title", defaultValue: '')
  final String title;
  @JsonKey(
    defaultValue: 'slugEmpty',
  )
  final String slug;

  JobEntity({this.id, this.title, this.slug});

  factory JobEntity.fromJson(Map<String, dynamic> json) =>
      _$JobEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobEntityToJson(this);

  @override
  Job transform() {
    return Job(
      id: id,
      title: title,
      slug: slug,
    );
  }
}
