import 'package:new_weather_app/data/mappers/mapper.dart';

import 'package:new_weather_app/data/models/response_models.dart';
import 'package:new_weather_app/data/service/weather_service.dart';
import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/presentation/base/base.dart';

abstract class WeatherDataSource {
  Future<AppResult> getWeather(City location);
}

class WeatherDataSourceImpl extends WeatherDataSource {
  final WeatherService service = WeatherServiceImpl();

  @override
  Future<AppResult> getWeather(City location) async {
    try {
      final response = await service.getWeather(location);

      final weatherResponseModel = WeatherResponseModel.fromJson(response.data);

      return AppResult.success(
          mapWeatherResponseModeltoWeather(weatherResponseModel));
    } on Exception catch (e) {
      print(e);
      return AppResult.failure('error getting weather');
    }
  }
}
