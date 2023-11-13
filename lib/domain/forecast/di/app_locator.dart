import 'package:weather_app/di/app_locator.dart';
import 'package:weather_app/domain/forecast/data/data_source/forecast_data_source.dart';
import 'package:weather_app/domain/forecast/data/repository/forecast_repositiory_impl.dart';
import 'package:weather_app/domain/forecast/data/service/forecast_service.dart';
import 'package:weather_app/domain/forecast/domain/repository/forecast_repository.dart';
import 'package:weather_app/domain/forecast/domain/use_cases/get_forecast_use_case.dart';

class ForecastLocator {
  static void init() {
    sl.registerLazySingleton(() => ForecastService());
    sl.registerLazySingleton<ForecastDataSource>(() => ForecastDataSourceImpl(sl()));
    sl.registerLazySingleton<ForecastRepository>(() => ForecastRepositoryImpl(sl()));
    sl.registerLazySingleton(() => GetForecastUseCase(sl()));
  }
}