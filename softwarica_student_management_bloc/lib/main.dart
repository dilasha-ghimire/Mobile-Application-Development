import 'package:flutter/cupertino.dart';
import 'package:softwarica_student_management_bloc/app/app.dart';
import 'package:softwarica_student_management_bloc/app/di/di.dart';
import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize the hive database
  await HiveService.init();

  //Initialize the dependencies
  await initDependencies();
  
  runApp(
    App(),
  );
}
