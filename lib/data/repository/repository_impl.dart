import 'package:new_weather_app/data/data_source/location_data_source.dart';
import 'package:new_weather_app/data/data_source/weather_data_source.dart';
import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/domain/repository/repository.dart';
import 'package:new_weather_app/presentation/base/app_result.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource = LocationDataSourceImpl();

  @override
  Future<AppResult> getLocation(String location) =>
      dataSource.getLocation(location);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource dataSource = WeatherDataSourceImpl();

  @override
  Future<AppResult> getWeather(City location) =>
      dataSource.getWeather(location);
}
