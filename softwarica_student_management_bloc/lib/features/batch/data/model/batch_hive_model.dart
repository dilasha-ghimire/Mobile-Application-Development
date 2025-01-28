import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build -d: run this command everytime to create adapter
//also run it whenever there are new parameters added to the model

//-d: delete conflicting files
  //it deletes files and re-generates them
part 'batch_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({
    String? batchId,
    required this.batchName
  }) : batchId = batchId ?? const Uuid().v4();

  //Initial constructor - for when the model is empty
  const BatchHiveModel.initial()
    : batchId = "",
      batchName = "";

  //To convert a BatchEntity object to a BatchHiveModel object
  //It extracts values from the BatchEntity object (entity.batchId and entity.batchName) 
    //and uses them to create and return a new BatchHiveModel instance
  factory BatchHiveModel.fromEntity(BatchEntity entity) {
    return BatchHiveModel(
      batchId: entity.batchId,
      batchName: entity.batchName
    );
  }

  //To return entity object to the ui
  BatchEntity toEntity() {
    return BatchEntity(
      batchId: batchId,
      batchName: batchName
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [batchId, batchName];
}