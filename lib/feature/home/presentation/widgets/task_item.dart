import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/theme/app_text_style.dart';

class TaskItem extends StatelessWidget {
  final TaskModel? task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(task?.color ?? 0),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  task?.title ?? "Task Title",
                  style: AppTextStyle.font20Bold.copyWith(color: Colors.white),
                ),
                Text(
                  "${task?.startTime} ${task?.endTime}",
                  style: AppTextStyle.font16A.copyWith(color: Colors.white),
                ),
                Text(
                  task?.description ?? "",
                  style: AppTextStyle.font16A.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 80, color: Colors.white),
          SizedBox(width: 12),
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              task?.status ?? "",
              style: AppTextStyle.font16A.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
