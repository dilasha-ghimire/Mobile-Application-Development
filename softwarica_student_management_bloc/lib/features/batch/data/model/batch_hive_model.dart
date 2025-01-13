import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build -d
part 'batch_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  const BatchHiveModel.initial()
      : batchId = "",
        batchName = '';

  factory BatchHiveModel.fromEntity(BatchEntity entity) {
    return BatchHiveModel(
      batchId: entity.batchId,
      batchName: entity.batchName,
    );
  }

  BatchEntity toEntity() {
    return BatchEntity(
      batchName: batchName,
      batchId: batchId,
    );
  }

  static List<BatchHiveModel> fromEntityList(List<BatchEntity> entityList) {
    return entityList
        .map((entity) => BatchHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [batchId, batchName];
}
