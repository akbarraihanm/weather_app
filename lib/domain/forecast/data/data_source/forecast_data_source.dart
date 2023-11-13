import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';
import 'package:weather_app/domain/forecast/data/service/forecast_service.dart';

abstract class ForecastDataSource {
  Future<ForecastResponse> getForecast(ForecastBody body);
}

class ForecastDataSourceImpl implements ForecastDataSource {
  final ForecastService service;

  ForecastDataSourceImpl(this.service);

  @override
  Future<ForecastResponse> getForecast(ForecastBody body) {
    return service.getForecast(body);
  }

}