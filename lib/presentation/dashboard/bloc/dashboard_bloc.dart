import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/forecast/data/models/body/forecast_body.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/domain/forecast/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetForecastUseCase getForecastUseCase;

  Position? position = Position.fromMap({
    "latitude": 0.0,
    "longitude": 0.0,
    "timestamp": DateTime.now().millisecondsSinceEpoch,
  });

  String location = "";

  List<DataForecastEntity> list = [];

  DashboardBloc(this.getForecastUseCase): super(ShowLoadingDashboard()) {
    on<GetCurrentLocationName>((event, emit) async {
      final locations = await placemarkFromCoordinates(
        position?.latitude ?? 0.0,
        position?.longitude ?? 0.0,
      );

      final locData = locations.first;
      if (locData.subAdministrativeArea != null) {
        location += "${locData.subLocality},";
      }
      if (locData.subLocality != null) {
        location += " ${locData.subAdministrativeArea}";
      } else {
        location = "Unidentified";
      }

      add(GetForecastData());
    });

    on<GetForecastData>((event, emit) async {
      final result = await getForecastUseCase.call(ForecastBody(
        lat: position?.latitude,
        lng: position?.longitude,
      ));

      if (result.message != null) {
        emit(ShowErrorDashboard(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowErrorDashboard(result.networkError ?? ""));
      } else {
        list = result.data?.list ?? [];

        emit(InitDashboard());
      }
    });
  }
}