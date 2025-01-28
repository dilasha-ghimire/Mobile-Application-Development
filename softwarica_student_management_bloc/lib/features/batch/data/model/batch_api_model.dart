import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

@JsonSerializable()
class BatchApiModel extends Equatable {
  @JsonKey(name: "_id")
  final String? batchId;
  final String batchName;

  const BatchApiModel({
    this.batchId,
    required this.batchName
  });

  const BatchApiModel.empty()
    : batchId = "",
      batchName = "";

  //to convert the output coming from server in json to BatchApiModel object
  factory BatchApiModel.fromJson(Map<String, dynamic> json) {
    return BatchApiModel(
      batchId: json["_id"],
      batchName: json["batchName"]
    );
  }

  //to convert the input data to json
  //"_id": batchId = not required because input data wont consist of id
  Map<String, dynamic> toJson() {
    return {
      "batchName": batchName
    };
  }

  //converting entity to batch api model object
  factory BatchApiModel.fromEntity(BatchEntity entity) {
    return BatchApiModel(
      batchId: entity.batchId,
      batchName: entity.batchName
    );
  }

  //converting batch api model object to entity
  BatchEntity toEntity() {
    return BatchEntity(
      batchId: batchId,
      batchName: batchName
    );
  }

  //converting api list to entity list
  static List<BatchEntity> toEntityList(List<BatchApiModel> models) =>
    models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [batchId, batchName];
}

