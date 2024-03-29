abstract class IRegisterEvent {}

class RegisterEvent extends IRegisterEvent {
  String userName;
  String password;
  RegisterEvent({required this.userName, required this.password});
}

class ValidaRegisterEvent extends IRegisterEvent {
  String userName;
  String password1;
  String password2;
  ValidaRegisterEvent({
    required this.userName,
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
