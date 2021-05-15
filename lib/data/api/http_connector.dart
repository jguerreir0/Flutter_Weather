import 'package:dio/dio.dart';
import 'package:new_weather_app/data/api/api.dart';
import 'package:new_weather_app/data/api/api_prod.dart';

class HttpConnector {
  Dio _dio;
  BaseApi api;

  HttpConnector._privateConstructor() {
    _init();
  }

  _init() {
    _dio = Dio();
    api = ApiProd();
  }

  String _buildBaseUrl(String url) => '${api.build()}$url';

  static final HttpConnector instance = HttpConnector._privateConstructor();

  Future<Response> get(
      {String url,
      Map<String, dynamic> queryParameters,
      Map<String, dynamic> headers}) {
    final String urll = _buildBaseUrl(url);

    return _dio.get(urll,
        queryParameters: queryParameters, options: Options(headers: headers));
  }
}
