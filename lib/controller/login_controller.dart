import 'package:flutter/material.dart';
import 'package:flutter_app_teacher_titya/api/apiservice.dart';
import 'package:flutter_app_teacher_titya/screen/home_page.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ApiProvider _apiProvider = Get.put(ApiProvider());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    try {
      final token = await _apiProvider.login(
        emailController.text,
        passwordController.text,
      );
      if (token != null) {
        Get.offAll(() => HomePage());
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
    } catch (error) {
      print(error);
      Get.snackbar('Error', 'Failed to login');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
