import 'package:flutter/material.dart';
import 'package:weather_app/core/config/app_typography.dart';
import 'package:weather_app/core/helper/datetime_formatter_helper.dart';
import 'package:weather_app/core/util/stretch_overscroll.dart';
import 'package:weather_app/core/widgets/app_bar/app_bar.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';

class ForecastDetailScreen extends StatelessWidget {
  static const routeName = "/forecast";
  final DataForecastEntity data;

  const ForecastDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.titled(title: "Weather Detail"),
      backgroundColor: Colors.blue,
      body: StretchOverScrollWidget(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                DateTimeFormatterHelper.formatTime(
                  dateTime: DateTime.parse(data.dtTxt),
                  dateFormat: "EEE, MMM d, yyyy",
                ),
                style: AppTypography.copyWith(
                  size: 20,
                  color: Colors.white,
                  weight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateTimeFormatterHelper.formatTime(
                  dateTime: DateTime.parse(data.dtTxt),
                  dateFormat: "HH:mm a",
                ),
                style: AppTypography.copyWith(
                  size: 16,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Hero(
                  tag: data.weathers.first.icon,
                  child: Image.network(
                    data.weathers.first.icon,
                    width: 400,
                  ),
                ),
              ),
              Text(
                "${data.main.temp}º (${data.weathers.first.main})",
                style: AppTypography.copyWith(
                  color: Colors.white,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TempItem(temp: data.main.tempMin),
                  _TempItem(temp: data.main.tempMax, isMin: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TempItem extends StatelessWidget {
  final double temp;
  final bool isMin;

  const _TempItem({
    Key? key,
    required this.temp,
    this.isMin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Temp (${isMin? "min": "max"})",
          style: AppTypography.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          "$tempº",
          style: AppTypography.copyWith(
            color: Colors.white,
            weight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
