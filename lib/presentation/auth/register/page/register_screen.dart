import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/util/app_util.dart';
import 'package:weather_app/core/widgets/app_bar/app_bar.dart';
import 'package:weather_app/core/widgets/button/app_button.dart';
import 'package:weather_app/core/widgets/forms/app_form_field.dart';
import 'package:weather_app/core/widgets/forms/password_form_field.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_bloc.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_event.dart';
import 'package:weather_app/presentation/auth/register/bloc/register_state.dart';
import 'package:weather_app/presentation/dashboard/page/dashboard_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";

  final emailCtrl = TextEditingController();
  final pwCtrl = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.backBtn(title: "Register", elevation: 2.0),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email"),
                      AppFormField(
                        margin: const EdgeInsets.only(top: 4, bottom: 16),
                        controller: emailCtrl,
                        bgColor: Colors.white,
                        borderColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4,
                        ),
                        onChanged: (v) {
                          context.read<RegisterBloc>().add(
                            ValidateRegisterForm(emailCtrl.text, pwCtrl.text),
                          );
                        },
                        hint: "Please insert your email",
                      ),
                      const Text("Password"),
                      PasswordFormField(
                        margin: const EdgeInsets.only(top: 4, bottom: 16),
                        controller: pwCtrl,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4,
                        ),
                        onChanged: (v) {
                          context.read<RegisterBloc>().add(
                            ValidateRegisterForm(emailCtrl.text, pwCtrl.text),
                          );
                        },
                        obscure: context.read<RegisterBloc>().isPasswordHidden,
                        onTapPassword: () {
                          context.read<RegisterBloc>().add(
                            VisibleRegisterPassword(emailCtrl.text, pwCtrl.text),
                          );
                        },
                        hint: "Please insert your password",
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    state.when(
                      onLoading: () {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                      onSuccess: () {
                        AppUtil.bindingInstance(() {
                          Navigator.pushReplacementNamed(
                            context,
                            DashboardScreen.routeName,
                          );
                        });
                      },
                      onError: (message) => Fluttertoast.showToast(msg: message),
                    );
                    return AppButton(
                      title: "Register",
                      radius: 8,
                      isEnable: context.read<RegisterBloc>().isValid,
                      onPressed: () => context.read<RegisterBloc>().add(
                        DoRegister(emailCtrl.text, pwCtrl.text),
                      ),
                    );
                  }
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
