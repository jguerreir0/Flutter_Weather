import 'package:dio/dio.dart';
import 'package:new_weather_app/data/api/api_resource.dart';
import 'package:new_weather_app/data/api/http_connector.dart';

abstract class LocationService {
  Future<Response> getLocation(String location);
}

class LocationServiceImpl extends LocationService {
  final HttpConnector httpConnector = HttpConnector.instance;

  @override
  Future<Response> getLocation(String location) => httpConnector
      .get(url: ApiResource.location, queryParameters: {'query': location});
}
