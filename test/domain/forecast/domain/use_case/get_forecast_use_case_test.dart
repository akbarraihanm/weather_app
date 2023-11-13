import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/util/resource.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/domain/forecast/domain/repository/forecast_repository.dart';
import 'package:weather_app/domain/forecast/domain/use_cases/get_forecast_use_case.dart';

class MockForecastRepository extends Mock implements ForecastRepository {}

void main() {
  late MockForecastRepository repository;
  late GetForecastUseCase useCase;

  setUpAll(() {
    repository = MockForecastRepository();
    useCase = GetForecastUseCase(repository);
  });

  final entity = ForecastEntity(
    cod: "",
    message:  0,
    cnt: 0,
    list: [DataForecastEntity(
      dt: 0,
      main: DataMainForecastEntity(
        temp: 0.0,
        tempMin: 0.0,
        tempMax: 0.0,
        humidity: 0.0,
      ),
      weathers: [],
      dtTxt: "1970-01-01 00:00:00",
    )],
  );

  group('GetForecastUseCase test', () {
    test("""
    Given GetForecastUseCase,
    When call success,
    Then it should return correct entity
    """, () async{
      final body = ForecastBody();
      final success = Resource.success(entity);
      when(() => repository.getForecast(body))
          .thenAnswer((_) async => success);

      final result = await useCase.call(body);

      expect(result.data?.list, success.data?.list);
    });
  });
}