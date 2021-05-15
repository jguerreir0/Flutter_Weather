import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/presentation/base/base.dart';

class LocationResultStream implements BaseResultStream<City, String> {
  @override
  City data;

  @override
  String error;

  @override
  Status state;

  LocationResultStream({this.data, this.error, this.state});
}
