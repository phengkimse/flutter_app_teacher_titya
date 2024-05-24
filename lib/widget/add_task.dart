// import 'package:flutter/material.dart';
// import 'package:flutter_app_teacher_titya/controller/add_data_controller.dart';
// import 'package:flutter_app_teacher_titya/model/add_model.dart';
// import 'package:flutter_app_teacher_titya/widget/add_task.dart';

// import 'package:flutter_app_teacher_titya/widget/appbar.dart';
// import 'package:flutter_app_teacher_titya/widget/button.dart';
// import 'package:flutter_app_teacher_titya/widget/textfield.dart';
// import 'package:get/get.dart';

// class AddTask extends StatelessWidget {
//   const AddTask({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final addTaskController = Get.put<AddtaskController>;
//     return BlankLayout(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//           child: Column(
//             children: [
//               const Textfield(
//                   labeltext: "Title", hinttext: "Send an email to the team"),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Textfield(labeltext: "Date", hinttext: "Mar 14, 2021"),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Textfield(
//                 labeltext: "Priority",
//                 hinttext: "High",
//                 suffixicon: Icon(
//                   Icons.stop_circle_rounded,
//                   color: Colors.red,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ButtonWidget(
//                 text: "Add",
//                 onPressed: () {
//                   addTask newProduct =
//                       addTask(date: 'Product Name', priority: "dd",title:"");
//                   addTaskController.(newProduct);
//                 },
//                 fullSize: true,
//               )
//             ],
//           ),
//         ),
//         text: const Text(
//           "Add Task",
//           style: TextStyle(color: Colors.red),
//         ));
//   }
// }
