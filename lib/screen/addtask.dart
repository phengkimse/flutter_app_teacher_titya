// views/add_task_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:get/get.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final List<String> priorities = ['Low', 'Medium', 'High'];
  var selectedPriority = 'Low'.obs;

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
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
                dataController.addTask(
                  titleController.text,
                  dateTimeController.text,
                  selectedPriority.value,
                );
                Get.back();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
