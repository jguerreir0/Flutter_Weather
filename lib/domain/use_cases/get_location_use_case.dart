import 'package:new_weather_app/domain/repository/repository.dart';
import 'package:new_weather_app/presentation/base/app_result.dart';

abstract class GetLocationUseCase {
  Future<AppResult> call(String location);
}

class GetLocation implements GetLocationUseCase {
  final LocationRepository repository;

  GetLocation(this.repository);

  @override
  Future<AppResult> call(String location) async {
    final result = await repository.getLocation(location);

    return result;
  }
}
