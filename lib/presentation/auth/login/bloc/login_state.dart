import 'package:flutter/material.dart';

abstract class LoginState {
  void when({
    Function? onInit,
    Function? onLoading,
    Function? onGoingHome,
    Function(String message)? onError,
  }) {
    final state = this;
    if (state is InitLogin) {
      onInit?.call();
    } else if (state is ShowLoadingLogin) {
      onLoading?.call();
    } else if (state is LoginGoToHome) {
      onGoingHome?.call();
    } else if (state is ShowErrorLogin) {
      onError?.call(state.message);
    }
  }

  Widget buildWhen({
    Widget? onInit,
    Widget? onLoading,
    Function? onGoingHome,
    Function(String message)? onError,
    required Widget initWidget,
  }) {
    final state = this;
    if (state is ShowLoadingLogin) {
      return onLoading ?? initWidget;
    } else if (state is LoginGoToHome) {
      onGoingHome?.call();
    } else if (state is ShowErrorLogin) {
      onError?.call(state.message);
    }

    return initWidget;
  }
}

class InitLogin extends LoginState {}

class ShowLoadingLogin extends LoginState {}

class LoginGoToHome extends LoginState {}

class ShowErrorLogin extends LoginState {
  String message;

  ShowErrorLogin(this.message);
}
