import 'dart:async';

import 'package:new_weather_app/data/repository/repository_impl.dart';
import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/domain/use_cases/get_location_use_case.dart';
import 'package:new_weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:new_weather_app/presentation/base/base.dart';
import 'package:new_weather_app/presentation/controllers/base_controller.dart';
import 'package:new_weather_app/presentation/result/result_streams.dart';
import 'package:new_weather_app/presentation/result/weather_result_stream.dart';

abstract class BaseHomePageController extends BaseController {
  getLocation(String location);

  getWeather(City location);

  disposeHome();

  City location;

  Weather weather;

  setWeather(Weather result);
}

class HomePageController extends BaseHomePageController {
  City location;

  Weather weather;

  GetLocationUseCase locationUseCase = GetLocation(LocationRepositoryImpl());

  GetWeatherUseCase weatherUseCase = GetWeather(WeatherRepositoryImpl());

  @override
  StreamController<BaseResultStream> stream =
      StreamController<BaseResultStream>();

  @override
  getLocation(String location) async {
    stream.add(LocationResultStream(state: Status.request));

    try {
      final result = await locationUseCase(location);

      switch (result.status) {
        case States.success:
          stream.add(
              LocationResultStream(state: Status.success, data: result.data));
          break;
        case States.failure:
          stream.add(
              LocationResultStream(state: Status.fail, error: result.error));
          break;
      }
    } on Exception catch (e) {
      print(e);
      stream.add(LocationResultStream(state: Status.fail));
    }
  }

  @override
  getWeather(City location) async {
    stream.add(WeatherResultStream(state: Status.request));

    try {
      final result = await weatherUseCase(location);

      switch (result.status) {
        case States.success:
          stream.add(
              WeatherResultStream(state: Status.success, data: result.data));
          break;
        case States.failure:
          stream.add(
              WeatherResultStream(state: Status.fail, error: result.error));
          break;
      }
    } on Exception catch (e) {
      print(e);
      stream.add(WeatherResultStream(state: Status.fail));
    }
  }

  @override
  disposeHome() {
    stream.close();
  }

  @override
  setWeather(Weather result) {
    weather = result;
    notifyListeners();
  }
}
