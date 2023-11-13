import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domain/forecast/data/data_source/forecast_data_source.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';
import 'package:weather_app/domain/forecast/data/service/forecast_service.dart';

class MockForecastService extends Mock implements ForecastService {}

void main() {
  late MockForecastService service;
  late ForecastDataSource dataSource;

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

  setUpAll(() {
    service = MockForecastService();
    dataSource = ForecastDataSourceImpl(service);
  });

  group('ForecastDataSourceTest', () {
    test("""
    Given ForecastDataSource,
    When call getForecast,
    Then it should return correct data
    """, () async {
      final body = ForecastBody();
      when(() => service.getForecast(body))
          .thenAnswer((_) async => response);

      final result = await dataSource.getForecast(body);

      expect(result.cod, response.cod);
      expect(result.message, response.message);
      expect(result.cnt, result.cnt);

      expect(result.list?.map((e) => e.toJson()).toList(), response.list?.map((e) => e.toJson()).toList());
    });
  });
}