import 'package:new_weather_app/data/models/city_response_model.dart';
import 'package:new_weather_app/data/models/response_models.dart';
import 'package:new_weather_app/domain/models/models.dart';

City mapCityResponseModeltoCity(CityResponseModel responseModel) => City(
    lattLong: responseModel.lattLong,
    locationType: responseModel.locationType,
    title: responseModel.title,
    woeid: responseModel.woeid);

Weather mapWeatherResponseModeltoWeather(WeatherResponseModel responseModel) =>
    Weather(
        condition: responseModel.condition,
        created: responseModel.created,
        formattedCondition: responseModel.formattedCondition,
        lastUpdated: responseModel.lastUpdated,
        location: responseModel.location,
        locationId: responseModel.locationId,
        maxTemp: responseModel.maxTemp,
        minTemp: responseModel.minTemp,
        temp: responseModel.temp);
