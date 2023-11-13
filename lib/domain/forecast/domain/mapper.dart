import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';

extension WeatherDataToEntity on WeatherData {
  DataWeatherEntity toEntity() => DataWeatherEntity(
    id: id ?? 0,
    main: main ?? "Unidentified",
    desc: desc ?? "No description",
    icon: icon ?? "",
  );
}

extension MainForecastDataToEntity on MainForecastData {
  DataMainForecastEntity toEntity() => DataMainForecastEntity(
    temp: temp ?? 0.0,
    tempMin: tempMin ?? 0.0,
    tempMax: tempMax ?? 0.0,
    humidity: humidity ?? 0.0,
  );
}

extension ForecastDataToEntity on ForecastData {
  DataForecastEntity toEntity() => DataForecastEntity(
    dt: dt ?? 0,
    main: main?.toEntity() ?? MainForecastData.fromJsonMap({}).toEntity(),
    weathers: weathers?.map((e) => e.toEntity()).toList() ?? [],
    dtTxt: dtTxt ?? "1970-01-01 00:00:00",
  );
}

extension ForecastResponseToEntity on ForecastResponse {
  ForecastEntity toEntity() => ForecastEntity(
    cod: cod ?? "",
    message: message ?? 0,
    cnt: cnt ?? 0,
    list: list?.map((e) => e.toEntity()).toList() ?? [],
  );
}