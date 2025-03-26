import 'package:dio/dio.dart';
import '../core/dio_client.dart';

class UserService {
  final Dio _dio = DioClient().dio;

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/user');
    return response.data;
  }

  Future<Map<String, dynamic>> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/user',
      data: {'name': name, 'email': email, 'password': password},
    );
    return response.data;
  }
}
