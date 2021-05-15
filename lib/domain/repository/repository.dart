import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/presentation/base/app_result.dart';

abstract class LocationRepository {
  Future<AppResult> getLocation(String location);
}

abstract class WeatherRepository {
  Future<AppResult> getWeather(City location);
}
