import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:flutter_app_teacher_titya/screen/login_page.dart';
import 'package:flutter_app_teacher_titya/screen/todo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(DataController());
      }),
      home: Todo(),
    );
  }
}
