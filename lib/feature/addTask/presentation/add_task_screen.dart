import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/widgets/custom_bottom.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  int activeColor = 0;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: const Text(
          "Add Task",
          style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tilte",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),

              CustomTextFormField(
                controller: titleController,
                labelText: 'Title',
                maxLines: 1,
              ),

              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: descriptionController,
                labelText: "Enter Description",
                maxLines: 3,
              ),
              Text(
                "Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: dateController,
                raedOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  ).then((v) {
                    dateController.text = DateFormat.yMMMMd().format(v!);
                  });
                },
                labelText: "Date",
                suffixIcon: Icon(Icons.calendar_month_outlined),
              ),
              SizedBox(height: 10),
              Text(
                "Time",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: startTimeController,
                      raedOnly: true,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((v) {
                          startTimeController.text = v!.format(context);
                        });
                      },
                      labelText: "Start Time",
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      controller: endTimeController,
                      raedOnly: true,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((v) {
                          endTimeController.text = v!.format(context);
                        });
                      },
                      labelText: "End Time",
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ColorItem(
                    ontap: () {
                      setState(() {
                        activeColor = index;
                      });
                    },
                    color: taskColors[index],
                    isActive: index == activeColor,
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: taskColors.length,
                ),
              ),
              SizedBox(height: 80),
              CustomBottom(
                title: "Save Task",
                onTap: () {
                  tasks.add(
                    TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dateController.text,
                      startTime: startTimeController.text,
                      endTime: endTimeController.text,
                      color: taskColors[activeColor].toARGB32(),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isActive;
  final void Function()? ontap;
  const ColorItem({
    super.key,
    required this.color,
    this.isActive = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: ontap,
          child: CircleAvatar(radius: 30, backgroundColor: color),
        ),
        if (isActive) Icon(Icons.check, color: Colors.white, size: 50),
      ],
    );
  }
}

List<Color> taskColors = [
  Colors.blue,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.red,
  Colors.cyanAccent,
  Colors.lime,
  Colors.blueGrey,
  Colors.purple,
  Colors.pink,
];
