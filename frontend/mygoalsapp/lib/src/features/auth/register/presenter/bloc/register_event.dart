abstract class IRegisterEvent {}

class RegisterEvent extends IRegisterEvent {
  String email;
  String password;
  RegisterEvent({required this.email, required this.password});
}

class ValidaRegisterEvent extends IRegisterEvent {
  String email;
  String password1;
  String password2;
  ValidaRegisterEvent({
    required this.email,
    required this.password1,
    required this.password2,
  });
}

class ValidaPasswordsEvent extends IRegisterEvent {
  String password1;
  String password2;
  ValidaPasswordsEvent({
    required this.password1,
    required this.password2,
  });
}
