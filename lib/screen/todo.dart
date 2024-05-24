import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
import 'package:flutter_app_teacher_titya/screen/addtask.dart';
import 'package:flutter_app_teacher_titya/screen/history.dart';
import 'package:flutter_app_teacher_titya/screen/update_task.dart';
import 'package:get/get.dart';

class Todo extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Row(
          children: [
            Text(
              "Text",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "Manager",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(const History()),
            icon: const Icon(Icons.settings_backup_restore_rounded),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              Get.to(const UpdateTask());
            },
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 390,
              height: 30,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 220, 220, 220),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text("You have [8] pending task out of [8]")),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataController.items.length,
                itemBuilder: (context, index) {
                  final item = dataController.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title']!),
                            Row(
                              children: [
                                Text(
                                    '${item['dateTime']} - ${item['priority']}'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.square_outlined))
                      ],
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTask());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
