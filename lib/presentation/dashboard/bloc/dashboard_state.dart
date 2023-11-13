import 'package:flutter/material.dart';

abstract class DashboardState {
  void when({
    Function? onInit,
    Function? onLoading,
    Function(String message)? onError
  }) {
    final state = this;
    if (state is InitDashboard) {
      onInit?.call();
    } else if (state is ShowLoadingDashboard) {
      onLoading?.call();
    } else if (state is ShowErrorDashboard) {
      onError?.call(state.message);
    }
  }

  Widget buildWhen({
    required Widget onInit,
    Widget? onLoading,
  }) {
    final state = this;
    if (state is InitDashboard) {
      return onInit;
    } else if (state is ShowLoadingDashboard) {
      return onLoading ?? onInit;
    }

    return onInit;
  }
}

class InitDashboard extends DashboardState {}

class ShowLoadingDashboard extends DashboardState {}

class ShowErrorDashboard extends DashboardState {
  String message;

  ShowErrorDashboard(this.message);
}
