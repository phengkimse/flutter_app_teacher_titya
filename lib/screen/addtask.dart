import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:flutter_app_teacher_titya/model/add_model.dart';
import 'package:flutter_app_teacher_titya/widget/add_task.dart';

import 'package:flutter_app_teacher_titya/widget/appbar.dart';
import 'package:flutter_app_teacher_titya/widget/button.dart';
import 'package:flutter_app_teacher_titya/widget/calendar.dart';
import 'package:flutter_app_teacher_titya/widget/textfield.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  final DataController dataController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final List<String> priorities = ['Low', 'Medium', 'High'];
  var selectedPriority = 'Low'.obs;
  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
            children: [
              Textfield(
                controller: titleController,
                labeltext: "Title",
                hinttext: "Send an email to the team",
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: dateTimeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                        dateTimeController.text =
                            pickedDate.toString().split(' ')[0];
                      }
                    },
                  ),
                ),
                readOnly: true,
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: "Add",
                onPressed: () {
                  dataController.addItem(
                    titleController.text,
                    dateTimeController.text,
                    selectedPriority.value,
                  );
                  Get.back();
                },
                // fullSize: true,
              )
            ],
          ),
        ),
        text: const Text(
          "Add Task",
          style: TextStyle(color: Colors.red),
        ));
  }
}
