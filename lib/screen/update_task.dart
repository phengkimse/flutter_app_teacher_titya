// views/update_task_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:flutter_app_teacher_titya/model/add_model.dart';
import 'package:get/get.dart';

class UpdateTaskPage extends StatelessWidget {
  final Task task;
  final TextEditingController titleController;
  final TextEditingController dateTimeController;
  final List<String> priorities = ['Low', 'Medium', 'High'];
  var selectedPriority;

  UpdateTaskPage({required this.task})
      : titleController = TextEditingController(text: task.title),
        dateTimeController = TextEditingController(text: task.dateTime),
        selectedPriority = task.priority.obs;

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Update Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: dateTimeController,
              decoration: InputDecoration(
                labelText: 'Date Time',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      dateTimeController.text = pickedDate
                          .toIso8601String()
                          .split('T')[0]; // Display only the date part
                    }
                  },
                ),
              ),
              readOnly: true,
            ),
            Obx(() {
              return DropdownButton<String>(
                value: selectedPriority.value,
                onChanged: (newValue) {
                  selectedPriority.value = newValue!;
                },
                items: priorities.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
              );
            }),
            ElevatedButton(
              onPressed: () {
                Task updatedTask = Task(
                  id: task.id,
                  title: titleController.text,
                  dateTime: dateTimeController.text,
                  priority: selectedPriority.value,
                );
                dataController.updateTask(updatedTask);
                Get.back();
              },
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
