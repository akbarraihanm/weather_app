import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_event.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool isValid = false;
  bool isPasswordHidden = true;

  RegisterBloc() : super(InitRegister()) {
    on<ValidateRegisterForm>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        isValid = true;
      } else {
        isValid = false;
      }
      emit(InitRegister());
    });

    on<VisibleRegisterPassword>((event, emit) {
      if (isPasswordHidden) {
        isPasswordHidden = false;
      } else {
        isPasswordHidden = true;
      }
      add(ValidateRegisterForm(event.email, event.password));
    });

    on<DoRegister>((event, emit) async {
      emit(ShowLoadingRegister());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(SuccessRegister());
      } on FirebaseAuthException catch (e) {
        emit(ShowErrorRegister("${e.message}"));
      }
    });
  }
}
