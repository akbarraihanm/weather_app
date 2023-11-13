import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';

class URL {
  static const _baseUrl = "https://api.openweathermap.org/data/2.5";
  static const apiKey = "000eb5d526ff412665c42c1ca0e167b7";
  static const units = "metric";

  static String foreCast(ForecastBody body) {
    return "$_baseUrl/forecast${body.toQuery()}";
  }
}