class ForecastResponse {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastData>? list;

  ForecastResponse.fromJsonMap(Map<String, dynamic> map) {
    cod = map['cod'];
    message = map['message'];
    cnt = map['cnt'];
    list = map['list'] == null? []: List.from(
      map['list'].map((it) => ForecastData.fromJsonMap(it)),
    );
  }

  Map<String, dynamic> toJson() => {
    'cod': cod,
    'message': message,
    'cnt': cnt,
    'list': list?.map((e) => e.toJson()).toList(),
  };
}

class ForecastData {
  int? dt;
  MainForecastData? main;
  List<WeatherData>? weathers;
  String? dtTxt;

  ForecastData.fromJsonMap(Map<String, dynamic> map) {
    dt = map['dt'];
    main = map['main'] == null? null: MainForecastData.fromJsonMap(map['main']);
    weathers = map['weather'] == null? []: List.from(
      map['weather'].map((it) => WeatherData.fromJsonMap(it)),
    );
    dtTxt = map['dt_txt'];
  }

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'main': main?.toJson(),
    'weather': weathers?.map((e) => e.toJson()).toList(),
    'dt_txt': dtTxt,
  };
}

class MainForecastData {
  double? temp;
  double? tempMin;
  double? tempMax;
  dynamic humidity;

  MainForecastData.fromJsonMap(Map<String, dynamic> map) {
    temp = map['temp'];
    tempMin = map['temp_min'];
    tempMax = map['temp_max'];
    humidity = map['humidity'];
  }

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'humidity': humidity,
  };
}

class WeatherData {
  int? id;
  String? main;
  String? desc;
  String? icon;

  WeatherData.fromJsonMap(Map<String, dynamic> map) {
    id = map['id'];
    main = map['main'];
    desc = map['desc'];
    icon = map['icon'] == null? null
        : "https://openweathermap.org/img/wn/${map['icon']}@4x.png";
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'desc': desc,
    'icon': icon,
  };
}