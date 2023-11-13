abstract class LoginEvent {}

class ValidateLoginForm extends LoginEvent {
  final String email;
  final String password;

  ValidateLoginForm(this.email, this.password);
}

class VisibileLoginPassword extends LoginEvent {}

class DoLogin extends LoginEvent {}