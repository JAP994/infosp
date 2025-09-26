import 'package:dio/dio.dart';
import 'package:infosp/config/constants.dart';

class DioClient {
  static Dio getClient() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // 🔹 Sin límite de tiempo
        connectTimeout: Duration.zero,
        receiveTimeout: Duration.zero,
      ),
    );
  }
}
