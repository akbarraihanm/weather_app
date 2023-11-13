import 'package:weather_app/core/network/url_helper.dart';

class ForecastBody {
  final double? lat;
  final double? lng;

  ForecastBody({this.lat, this.lng});

  String toQuery() => "?lat=$lat&lon=$lng&appid=${URL.apiKey}&units=${URL.units}";
}