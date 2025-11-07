import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/helper/app_String.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';
import 'package:taskati/taskati.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(AppString.userBox);
  await Hive.openBox<TaskModel>(AppString.tasksBox);

  runApp(Taskati());
}
