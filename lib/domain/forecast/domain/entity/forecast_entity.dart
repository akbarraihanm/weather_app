class ForecastEntity {
  final String cod;
  final int message;
  final int cnt;
  final List<DataForecastEntity> list;

  ForecastEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });
}

class DataForecastEntity {
  final int dt;
  final DataMainForecastEntity main;
  final List<DataWeatherEntity> weathers;
  final String dtTxt;

  DataForecastEntity({
    required this.dt,
    required this.main,
    required this.weathers,
    required this.dtTxt,
  });
}

class DataMainForecastEntity {
  final double temp;
  final double tempMin;
  final double tempMax;
  final dynamic humidity;

  DataMainForecastEntity({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });
}

class DataWeatherEntity {
  final int id;
  final String main;
  final String desc;
  final String icon;

  DataWeatherEntity({
    required this.id,
    required this.main,
    required this.desc,
    required this.icon,
  });
}