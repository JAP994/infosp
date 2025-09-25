import 'package:dio/dio.dart';
import '../../config/constants.dart';

class DioClient {
  static Dio getClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10), // máximo para conectar
        receiveTimeout: const Duration(
          seconds: 10,
        ), // máximo para recibir respuesta
        sendTimeout: const Duration(seconds: 10), // máximo para enviar datos
      ),
    );

    // 🔹 Interceptor opcional para depuración de peticiones y respuestas
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }
}
