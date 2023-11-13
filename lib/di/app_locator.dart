import 'package:get_it/get_it.dart';
import 'package:weather_app/domain/forecast/di/app_locator.dart';

final sl = GetIt.instance;

class AppLocator {
  static void init() {
    ForecastLocator.init();
  }
}