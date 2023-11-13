import 'package:weather_app/core/network/http_helper.dart';
import 'package:weather_app/core/network/url_helper.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/data/models/response/forecast_response.dart';

class ForecastService extends HttpHelper {
  Future<ForecastResponse> getForecast(ForecastBody body) async {
    final map = await getMethod(URL.foreCast(body));
    return ForecastResponse.fromJsonMap(map);
  }
}