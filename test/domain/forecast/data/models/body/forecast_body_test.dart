import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';

void main() {
  final body = ForecastBody(lat: 0.1, lng: 0.1);

  test(
    """
    Given ForecastBody,
    When initialized,
    Then it should return correct data
    """, () {
      expect(body.lat, 0.1);
      expect(body.lng, 0.1);
    }
  );
}