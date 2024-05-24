// import 'package:get/get.dart';
// import 'package:dio/dio.dart';

// class AuthController extends GetxController {
//   var isLoading = false.obs;
//   var token = ''.obs;

//   get isAuthenticated => null;

//   Future<void> login(String email, String password) async {
//     isLoading.value = true;

//     try {
//       final response = await Dio().post(
//         'http://194.233.65.64:8081/api/login',
//         data: {
//           'email': email,
//           'password': password,
//           'client_id': '9ae60e62-4280-4265-8bd0-dd29a79c5bff',
//           'client_secret': 'uq5UofGMQcfjiXu7keGqo2OjAkls0jI50lES7udL'
//         },
//       );

//       if (response.data['status'] == 200) {
//         token.value = response.data['access_token'];
//         Get.offNamed('/home');
//       } else {
//         Get.snackbar('Error', 'Login failed');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Login failed');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void logout() {
//     token.value = '';
//     Get.offAllNamed('/login');
//   }
// }
