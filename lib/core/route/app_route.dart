import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/app_locator.dart';
import 'package:weather_app/domain/forecast/domain/entity/forecast_entity.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/auth/login/pages/login_screen.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_bloc.dart';
import 'package:weather_app/presentation/auth/register/page/register_screen.dart';
import 'package:weather_app/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:weather_app/presentation/dashboard/page/dashboard_screen.dart';
import 'package:weather_app/presentation/dashboard/page/forecast_detail_screen.dart';
import 'package:weather_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:weather_app/presentation/splash/bloc/splash_event.dart';
import 'package:weather_app/presentation/splash/page/splash_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => BlocProvider<SplashBloc>(
        create: (_) => SplashBloc()..add(CheckCredential()),
        child: const SplashScreen(),
      ),
      LoginScreen.routeName: (context) => BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(),
        child: LoginScreen(),
      ),
      RegisterScreen.routeName: (context) => BlocProvider<RegisterBloc>(
        create: (_) => RegisterBloc(),
        child: RegisterScreen(),
      ),
      DashboardScreen.routeName: (context) => BlocProvider<DashboardBloc>(
        create: (_) => DashboardBloc(sl()),
        child: const DashboardScreen(),
      ),
      ForecastDetailScreen.routeName: (context) {
        final param = ModalRoute.of(context)?.settings
            .arguments as DataForecastEntity;

        return ForecastDetailScreen(data: param);
      }
    };
  }
}