import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:intl/intl.dart'; // Import intl package for date formatting

// GetX Controller
class CalculatorController extends GetxController {
  var firstValue = ''.obs;
  var secondValue = ''.obs;

  double get result =>
      double.tryParse(secondValue.value)! - double.tryParse(firstValue.value)!;
}

// Custom Khmer Calendar Widget showing a Calendar
class KhmerCalendarWidget extends StatelessWidget {
  final RxString controller;

  const KhmerCalendarWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        // Show the date picker dialog
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        // If date is picked, set it to the text field
        if (pickedDate != null) {
          final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.value = formattedDate;
        }
      },
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Khmer Calendar Widget Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(), // Text field controller
                decoration: InputDecoration(
                  labelText: 'First Value',
                  suffixIcon: KhmerCalendarWidget(
                    controller: controller.firstValue,
                  ), // Use KhmerCalendarWidget as suffix icon
                ),
                onChanged: (value) => controller.firstValue.value = value,
              ),
              SizedBox(height: 20),
              TextField(
                controller: TextEditingController(), // Text field controller
                decoration: InputDecoration(
                  labelText: 'Second Value',
                  suffixIcon: KhmerCalendarWidget(
                    controller: controller.secondValue,
                  ), // Use KhmerCalendarWidget as suffix icon
                ),
                onChanged: (value) => controller.secondValue.value = value,
              ),
              SizedBox(height: 20),
              GetX<CalculatorController>(
                builder: (controller) {
                  return Text(
                    'Result: ${controller.result}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
