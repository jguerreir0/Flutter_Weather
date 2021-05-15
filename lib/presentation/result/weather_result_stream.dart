import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/presentation/base/base.dart';

class WeatherResultStream implements BaseResultStream<Weather, String> {
  @override
  Weather data;

  @override
  String error;

  @override
  Status state;

  WeatherResultStream({this.data, this.error, this.state});
}
