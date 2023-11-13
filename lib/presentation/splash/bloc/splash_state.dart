abstract class SplashState {
  void when({
    Function? onInit,
    Function? openHome,
    Function? openLogin,
  }) {
    final state = this;
    if (state is InitSplash) {
      onInit?.call();
    } else if (state is OpenHomeScreen) {
      openHome?.call();
    } else if (state is OpenLoginScreen) {
      openLogin?.call();
    }
  }
}

class InitSplash extends SplashState {}

class OpenHomeScreen extends SplashState {}

class OpenLoginScreen extends SplashState {}