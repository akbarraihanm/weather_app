import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domain/forecast/data/data_source/forecast_data_source.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';
import 'package:weather_app/domain/forecast/data/repository/forecast_repositiory_impl.dart';
import 'package:weather_app/domain/forecast/domain/repository/forecast_repository.dart';

class MockForecastDataSource extends Mock implements ForecastDataSource {}

void main() {
  late MockForecastDataSource dataSource;
  late ForecastRepository repository;

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
    dataSource = MockForecastDataSource();
    repository = ForecastRepositoryImpl(dataSource);
  });

  group('ForecastRepositoryImpl test', () {
    test("""
    Given ForecastRepositoryImpl,
    When getForecast called success,
    Then it should return correct data.
    """, () async {
      final body = ForecastBody();

      when(() => dataSource.getForecast(body))
          .thenAnswer((_) async => response);

      final result = await repository.getForecast(body);

      /// Response
      expect(result.data?.cod, response.cod);
      expect(result.data?.message, response.message);
      expect(result.data?.cnt, response.cnt);

      /// List
      expect(result.data?.list.first.dt, response.list?.first.dt);
      expect(result.data?.list.first.weathers.first.id, response.list?.first.weathers?.first.id);
      expect(result.data?.list.first.dtTxt, response.list?.first.dtTxt);
    });
  });
}