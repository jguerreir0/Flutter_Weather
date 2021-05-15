import 'package:new_weather_app/data/api/api.dart';

class ApiProd extends BaseApi {
  @override
  String get api => 'www.metaweather.com';

  @override
  String build() => '$scheme://$api$apiVersion';
}

// IF HAD DEV API WOULD IMPLEMENT HERE
