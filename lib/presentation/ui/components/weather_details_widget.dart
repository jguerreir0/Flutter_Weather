import 'package:flutter/cupertino.dart';
import 'package:new_weather_app/domain/models/models.dart';
import 'package:new_weather_app/presentation/ui/components/widgets.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Weather weather;

  const WeatherDetailsWidget({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      color: weather.mapWeatherConditionToColor(),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Location(location: weather.location),
            ),
          ),
          Center(
            child: LastUpdated(dateTime: weather.lastUpdated),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: CombinedWeatherTemperature(
                weather: weather,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
