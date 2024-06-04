// controllers/data_controller.dart
import 'package:flutter_app_teacher_titya/helper/db_helper.dart';
import 'package:flutter_app_teacher_titya/model/add_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void addTask(String title, String dateTime, String priority) async {
    Task task = Task(title: title, dateTime: dateTime, priority: priority);
    await DatabaseHelper().insertTask(task);
    loadTasks();
  }

  void loadTasks() async {
    tasks.value = await DatabaseHelper().getTasks();
  }

  void deleteTask(int id) async {
    await DatabaseHelper().deleteTask(id);
    loadTasks();
  }

  void updateTask(Task task) async {
    await DatabaseHelper().updateTask(task);
    loadTasks();
  }
}
