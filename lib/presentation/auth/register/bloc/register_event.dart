abstract class RegisterEvent {}

class ValidateRegisterForm extends RegisterEvent {
  final String email;
  final String password;

  ValidateRegisterForm(this.email, this.password);
}

class DoRegister extends RegisterEvent {
  final String email;
  final String password;

  DoRegister(this.email, this.password);
}

class VisibleRegisterPassword extends RegisterEvent {
  final String email;
  final String password;

  VisibleRegisterPassword(this.email, this.password);
}