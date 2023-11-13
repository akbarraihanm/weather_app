import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';

void main() {
  final response = ForecastResponse.fromJsonMap({
    'cod': "200",
    'message': 0,
    'cnt': 0,
    'list': [ForecastData.fromJsonMap({
      'dt': 0,
      'main': MainForecastData.fromJsonMap({
        'temp': 0.1,
        'temp_min': 0.1,
        'temp_max': 0.3,
        'humidity': 100,
      }).toJson(),
      'weather': [WeatherData.fromJsonMap({
        'id': 0,
        'main': "main",
        'desc': "desc",
        'icon': "icon",
      }).toJson()],
      'dt_txt': "",
    }).toJson()],
  });

  test(
    """
    Given ForecastResponse,
    When initialized,
    It should return correct data
    """, () {
      expect(response.cod, "200");
      expect(response.message, 0);
      expect(response.cnt, 0);

      expect(response.list?.isEmpty, false);
      expect(response.list?.first.dt, 0);
      expect(response.list?.first.weathers?.isEmpty, false);
    }
  );
}