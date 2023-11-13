import 'package:weather_app/core/util/resource.dart';
import 'package:weather_app/core/util/use_case.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/domain/forecast/domain/repository/forecast_repository.dart';

class GetForecastUseCase extends UseCase<ForecastEntity, ForecastBody> {
  final ForecastRepository repository;

  GetForecastUseCase(this.repository);

  @override
  Future<Resource<ForecastEntity>> call(ForecastBody param) {
    return repository.getForecast(param);
  }

}