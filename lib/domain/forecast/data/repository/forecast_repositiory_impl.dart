import 'dart:convert';

import 'package:weather_app/core/network/api_exception.dart';
import 'package:weather_app/core/util/resource.dart';
import 'package:weather_app/domain/forecast/data/data_source/forecast_data_source.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/domain/forecast/domain/mapper.dart';
import 'package:weather_app/domain/forecast/domain/repository/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastDataSource dataSource;

  ForecastRepositoryImpl(this.dataSource);

  @override
  Future<Resource<ForecastEntity>> getForecast(ForecastBody body) async {
    try {
      final result = await dataSource.getForecast(body);
      return Resource.success(result.toEntity());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }

}