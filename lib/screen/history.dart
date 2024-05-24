import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/widget/appbar.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send an email to the team",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mar 14, 2021 * High",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.black,
          label: Text("Task Resign", style: TextStyle(color: Colors.white)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        text: Text(
          "History",
          style: TextStyle(color: Colors.red),
        ));
  }
}
