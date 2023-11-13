import 'package:flutter/material.dart';
import 'package:weather_app/core/config/app_typography.dart';
import 'package:weather_app/core/helper/datetime_formatter_helper.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/presentation/dashboard/page/forecast_detail_screen.dart';

class WeatherItem extends StatelessWidget {
  final DataForecastEntity? data;

  const WeatherItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(
        context,
        ForecastDetailScreen.routeName,
        arguments: data,
      ),
      child: Column(
        children: [
          Text(
            DateTimeFormatterHelper.formatTime(
              dateFormat: "E, MMM d, yyyy HH:mm a",
              dateTime: DateTime.parse(data?.dtTxt ?? "2020-01-01"),
            ),
            style: AppTypography.copyWith(
              size: 18,
              color: Colors.white,
              weight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Hero(
              tag: data?.weathers.first.icon ?? "weather_icon",
              child: Image.network(
                data?.weathers.first.icon ?? "",
                height: 200,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                data?.weathers.first.main ?? "",
                style: AppTypography.copyWith(
                  color: Colors.white,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
              Text(
                "${data?.main.temp ?? 0.0}º",
                style: AppTypography.copyWith(
                  color: Colors.white,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Click for detail",
                style: AppTypography.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_circle_right,
                size: 40,
                color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
