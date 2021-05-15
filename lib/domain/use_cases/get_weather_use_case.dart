import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/domain/repository/repository.dart';
import 'package:new_weather_app/presentation/base/app_result.dart';

abstract class GetWeatherUseCase {
  Future<AppResult> call(City location);
}

class GetWeather implements GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeather(this.repository);

  @override
  Future<AppResult> call(City location) async {
    final result = await repository.getWeather(location);

    return result;
  }
}
