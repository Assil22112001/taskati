import 'package:hive_flutter/hive_flutter.dart';


part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;
    @HiveField(1)

  String description;
    @HiveField(2)

  String date;
    @HiveField(3)

  String startTime;
    @HiveField(4)

  String endTime;
    @HiveField(5)

  int color;
    @HiveField(6)

      String status;


  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    this.status="ToDo",
  });
}

List<TaskModel> tasks = [];
