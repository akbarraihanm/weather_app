import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/config/app_typography.dart';
import 'package:weather_app/core/const/icon_string.dart';
import 'package:weather_app/core/util/app_util.dart';
import 'package:weather_app/core/util/stretch_overscroll.dart';
import 'package:weather_app/core/widgets/button/app_button.dart';
import 'package:weather_app/core/widgets/forms/app_form_field.dart';
import 'package:weather_app/core/widgets/forms/password_form_field.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_event.dart';
import 'package:weather_app/presentation/auth/login/bloc/login_state.dart';
import 'package:weather_app/presentation/auth/register/page/register_screen.dart';
import 'package:weather_app/presentation/dashboard/page/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  final emailCtrl = TextEditingController();
  final pwCtrl = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(height: 64),
          Center(
            child: Text(
              "Sign In to use the Weather App",
              style: AppTypography.copyWith(
                size: 18,
                color: Colors.white,
                weight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Hero(
            tag: IconString.weather,
            child: Image.asset(
              IconString.weather,
              height: 88,
              width: 88,
            ),
          ),
          Expanded(
            child: Center(
              child: StretchOverScrollWidget(
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: AppTypography.copyWith(color: Colors.white),
                          ),
                          AppFormField(
                            controller: emailCtrl,
                            margin: const EdgeInsets.only(top: 4, bottom: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            borderColor: Colors.black,
                            bgColor: Colors.white,
                            hint: "Input email",
                            onChanged: (v) {
                              context.read<LoginBloc>().add(
                                ValidateLoginForm(emailCtrl.text, pwCtrl.text),
                              );
                            },
                          ),
                          Text(
                            "Password",
                            style: AppTypography.copyWith(color: Colors.white),
                          ),
                          PasswordFormField(
                            margin: const EdgeInsets.only(top: 4),
                            controller: pwCtrl,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4,
                            ),
                            onChanged: (v) {
                              context.read<LoginBloc>().add(
                                ValidateLoginForm(emailCtrl.text, pwCtrl.text),
                              );
                            },
                            obscure: context.read<LoginBloc>().isPasswordHidden,
                            onTapPassword: () {
                              context.read<LoginBloc>().add(
                                VisibileLoginPassword(),
                              );
                            },
                            hint: "Please insert your password",
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.buildWhen(
                initWidget: AppButton(
                  title: "Sign In",
                  margin: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  color: Colors.amber,
                  isEnable: context.read<LoginBloc>().isValid,
                  textStyle: AppTypography.copyWith(
                    color: Colors.black,
                    weight: FontWeight.w600,
                  ),
                  onPressed: () => context.read<LoginBloc>().add(DoLogin()),
                ),
                onError: (message) => Fluttertoast.showToast(msg: message),
                onLoading: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                onGoingHome: () {
                  AppUtil.bindingInstance(() {
                    Navigator.pushReplacementNamed(
                      context,
                      DashboardScreen.routeName,
                    );
                  });
                }
              );
            }
          ),
          Text(
            "Don't have an account?",
            style: AppTypography.copyWith(
              color: Colors.black,
              weight: FontWeight.w600,
            ),
          ),
          AppButton(
            title: "Register",
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            textStyle: AppTypography.copyWith(
              color: Colors.black,
              weight: FontWeight.w600,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pushNamed(
              context,
              RegisterScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
