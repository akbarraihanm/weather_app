import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_event.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String email = "";
  String password = "";

  bool isValid = false;
  bool isPasswordHidden = true;

  LoginBloc(): super(InitLogin()) {
    on<ValidateLoginForm>((event, emit) {
      email = event.email;
      password = event.password;
      if (email.isNotEmpty && password.isNotEmpty) {
        isValid = true;
      } else {
        isValid = false;
      }

      emit(InitLogin());
    });

    on<VisibileLoginPassword>((event, emit) {
      if (isPasswordHidden) {
        isPasswordHidden = false;
      } else {
        isPasswordHidden = true;
      }

      add(ValidateLoginForm(email, password));
    });

    on<DoLogin>((event, emit) async {
      emit(ShowLoadingLogin());

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        emit(LoginGoToHome());
      } on FirebaseAuthException catch (e) {
        emit(ShowErrorLogin("${e.message}"));
      }
    });
  }

}