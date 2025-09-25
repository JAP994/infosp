import 'package:dio/dio.dart';
import 'package:infosp/config/constants.dart';

class DioClient {
  static Dio getClient() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }
}
