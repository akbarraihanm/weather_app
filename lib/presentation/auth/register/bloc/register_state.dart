abstract class RegisterState {
  void when({
    Function? onInit,
    Function? onLoading,
    Function? onSuccess,
    Function(String message)? onError,
  }) {
    final state = this;
    if (state is InitRegister) {
      onInit?.call();
    } else if (state is ShowLoadingRegister) {
      onLoading?.call();
    } else if (state is SuccessRegister) {
      onSuccess?.call();
    } else if (state is ShowErrorRegister) {
      onError?.call(state.message);
    }
  }
}

class InitRegister extends RegisterState {}

class ShowLoadingRegister extends RegisterState {}

class SuccessRegister extends RegisterState {}

class ShowErrorRegister extends RegisterState {
  String message;

  ShowErrorRegister(this.message);
}
