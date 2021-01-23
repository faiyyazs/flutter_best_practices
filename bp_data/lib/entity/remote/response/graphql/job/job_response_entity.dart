import 'package:bp_data/entity/remote/response/graphql/job/job_entity.dart';
import 'package:bp_domain/utils/mapper/base_layer_data_tranformer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bp_domain/model/job.dart';

part 'job_response_entity.g.dart';

@JsonSerializable()
class JobResponseEntity extends BaseGraphResponseEntity<JobResponseEntity,List<Job>> {

  List<JobEntity> jobs;

  JobResponseEntity({
    errorCode,
    error,
    message,
    this.jobs,
  }):super(error:error,errorCode: errorCode,message: message);

  factory JobResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$JobResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobResponseEntityToJson(this);

  List<Job> transform() {
    return this.jobs.map((e) => e.transform()).toList();
  }
}

class BaseGraphResponseEntity<T,F> with BaseLayerDataTransformer<T,F>{
  @JsonKey(name: 'errorCode', defaultValue: "", includeIfNull: false)
  String errorCode;
  @JsonKey(name: 'error', defaultValue: false, includeIfNull: false)
  bool error;
  @JsonKey(name: 'message', defaultValue: "", includeIfNull: false)
  String message;

  T data;

  BaseGraphResponseEntity({this.errorCode,this.error,this.message});
}
