import 'package:dio/dio.dart';
import 'package:new_weather_app/data/api/api_resource.dart';
import 'package:new_weather_app/data/api/http_connector.dart';
import 'package:new_weather_app/domain/models/models.dart';

abstract class WeatherService {
  Future<Response> getWeather(City location);
}

class WeatherServiceImpl extends WeatherService {
  final HttpConnector httpConnector = HttpConnector.instance;

  @override
  Future<Response> getWeather(City location) =>
      httpConnector.get(url: ApiResource.weather(location.woeid));
}
