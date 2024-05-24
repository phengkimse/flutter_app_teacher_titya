import 'package:dio/dio.dart';
import 'package:flutter_app_teacher_titya/mode/token_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://194.233.65.64:8081/api';
  final GetStorage _box = GetStorage();

  Future<TokenModel> login(String email, String password) async {
    try {
      final response = await _dio.post('$_baseUrl/login', data: {
        'email': email,
        'password': password,
        'client_id': '9ae60e62-4280-4265-8bd0-dd29a79c5bff',
        'client_secret': 'uq5UofGMQcfjiXu7keGqo2OjAkls0jI50lES7udL',
      });
      final token = TokenModel.fromJson(response.data);
      _box.write('accessToken', token.accessToken);
      _box.write('refreshToken', token.refreshToken);
      return token;
    } catch (error) {
      rethrow;
    }
  }

  Future<TokenModel> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post('$_baseUrl/refresh', data: {
        'refresh_token': refreshToken,
        'client_id': '9ae60e62-4280-4265-8bd0-dd29a79c5bff',
        'client_secret': 'uq5UofGMQcfjiXu7keGqo2OjAkls0jI50lES7udL',
      });
      final token = TokenModel.fromJson(response.data);
      _box.write('accessToken', token.accessToken);
      _box.write('refreshToken', token.refreshToken);
      return token;
    } catch (error) {
      rethrow;
    }
  }

  String? getAccessToken() => _box.read('accessToken');
  String? getRefreshToken() => _box.read('refreshToken');
}
