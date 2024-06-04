// views/todo_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:flutter_app_teacher_titya/screen/addtask.dart';
import 'package:flutter_app_teacher_titya/screen/update_task.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());

    return Scaffold(
      appBar: AppBar(
          title: const Row(
        children: [
          Text('Todo', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Manager',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ],
      )),
      body: Obx(() {
        return ListView.builder(
          itemCount: dataController.tasks.length,
          itemBuilder: (context, index) {
            final task = dataController.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text('${task.dateTime} - ${task.priority}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  dataController.deleteTask(task.id!);
                },
              ),
              onTap: () {
                Get.to(() => UpdateTaskPage(task: task));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTaskPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
