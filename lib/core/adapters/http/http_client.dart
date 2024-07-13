import 'package:tmdb/core/adapters/http/models/http_response.dart';

/// Http Client Interface.
abstract interface class HttpClient {
  /// Http get request.
  Future<HttpResponse<T?>> get<T>(String path);

  // You can add other http methods and params when necessary.
}
