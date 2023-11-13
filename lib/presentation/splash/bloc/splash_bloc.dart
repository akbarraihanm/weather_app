import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/presentation/splash/bloc/splash_event.dart';
import 'package:weather_app/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(): super(InitSplash()) {
    on<CheckCredential>((event, emit) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(OpenLoginScreen());
      } else {
        emit(OpenHomeScreen());
      }
    });
  }

}