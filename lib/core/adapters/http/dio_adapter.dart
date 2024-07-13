import 'package:dio/dio.dart';
import 'package:tmdb/core/adapters/http/http_client.dart';
import 'package:tmdb/core/adapters/http/models/http_response.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/environments/env.dart';

class DioClientAdapter implements HttpClient {
  DioClientAdapter({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
  }

  /// The Dio Http client.
  late final Dio dio;

  /// Timeout Duration
  final timeoutDuration = const Duration(seconds: 30);

  /// The Dio base options.
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: timeoutDuration,
        queryParameters: {'api_key': Env.apiKey},
      );

  @override
  Future<HttpResponse<T?>> get<T>(String path) async {
    final response = await dio.get<T>(path);

    return HttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
