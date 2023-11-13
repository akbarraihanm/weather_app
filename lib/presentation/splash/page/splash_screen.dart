import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/const/icon_string.dart';
import 'package:weather_app/presentation/auth/login/pages/login_screen.dart';
import 'package:weather_app/presentation/dashboard/page/dashboard_screen.dart';
import 'package:weather_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:weather_app/presentation/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.when(
            openLogin: () {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              });
            },
            openHome: () {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
              });
            },
          );
        },
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Hero(
              tag: IconString.weather,
              child: Image.asset(
                IconString.weather,
                height: 80,
                width: 80,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
