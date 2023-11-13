import 'package:weather_app/core/util/resource.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';

abstract class ForecastRepository {
  Future<Resource<ForecastEntity>> getForecast(ForecastBody body);
}