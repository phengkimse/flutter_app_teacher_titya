import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/widget/appbar.dart';
import 'package:flutter_app_teacher_titya/widget/button.dart';
import 'package:flutter_app_teacher_titya/widget/textfield.dart';
import 'package:get/get.dart';

class UpdateTask extends StatelessWidget {
  const UpdateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
            children: [
              const Textfield(
                  labeltext: "Title", hinttext: "Send an email to the team"),
              const SizedBox(
                height: 20,
              ),
              const Textfield(labeltext: "Date", hinttext: "Mar 14, 2021"),
              const SizedBox(
                height: 20,
              ),
              const Textfield(
                labeltext: "Priority",
                hinttext: "High",
                suffixicon: Icon(
                  Icons.stop_circle_rounded,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: "Update",
                onPressed: () {},
                fullSize: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: "Delete",
                onPressed: () {},
                fullSize: true,
              )
            ],
          ),
        ),
        text: const Text(
          "Update Task",
          style: TextStyle(color: Colors.red),
        ));
  }
}
