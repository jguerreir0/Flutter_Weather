import 'package:flutter/material.dart';
import 'package:new_weather_app/data/models/weather_response_model.dart';

class Weather {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });

  MaterialColor mapWeatherConditionToColor() {
    switch (this.condition) {
      case WeatherCondition.snow:
        break;
      case WeatherCondition.sleet:
        return Colors.lightBlue;
        break;
      case WeatherCondition.hail:
        break;
      case WeatherCondition.thunderstorm:
        return Colors.deepPurple;
        break;
      case WeatherCondition.heavyRain:
        break;
      case WeatherCondition.lightRain:
        break;
      case WeatherCondition.showers:
        return Colors.indigo;
        break;
      case WeatherCondition.heavyCloud:
        return Colors.grey;
        break;
      case WeatherCondition.lightCloud:
        return Colors.yellow;
        break;
      case WeatherCondition.clear:
        break;
      case WeatherCondition.unknown:
        return Colors.lightBlue;
        break;
    }

    return Colors.lightBlue;
  }
}
