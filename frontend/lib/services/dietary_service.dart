import 'package:dio/dio.dart';
import '../core/dio_client.dart';

class DietaryService {
  final Dio _dio = DioClient().dio;

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/user');
    return response.data;
  }

  Future<List<dynamic>> getDietaryRestrictions() async {
    final response = await _dio.get('/dietary-restriction');
    return response.data;
  }

  Future<void> assignRestrictionToUser(int userId, int dietaryId) async {
    await _dio.post('/user/$userId/dietary/$dietaryId');
  }
}
