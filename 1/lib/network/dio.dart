import "package:dio/dio.dart";

class DioClient {
  static final _options = BaseOptions(baseUrl: "http://127.0.0.1:3000");
  static final Dio dio = Dio(_options);
}
