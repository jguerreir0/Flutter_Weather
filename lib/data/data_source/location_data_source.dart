import 'package:new_weather_app/data/mappers/mapper.dart';
import 'package:new_weather_app/data/models/city_response_model.dart';
import 'package:new_weather_app/data/service/location_service.dart';
import 'package:new_weather_app/presentation/base/base.dart';

abstract class LocationDataSource {
  Future<AppResult> getLocation(String location);
}

class LocationDataSourceImpl extends LocationDataSource {
  final LocationService service = LocationServiceImpl();

  @override
  Future<AppResult> getLocation(String location) async {
    try {
      final response = await service.getLocation(location);

      final cityResponseModel = CityResponseModel.fromJson(response.data[0]);

      return AppResult.success(mapCityResponseModeltoCity(cityResponseModel));
    } on Exception catch (e) {
      print(e);
      return AppResult.failure('error getting location');
    }
  }
}
