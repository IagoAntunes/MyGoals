abstract class ILoginEvent {
  String userName;
  String password;
  ILoginEvent({
    required this.userName,
    required this.password,
  });
}

class LoginEvent extends ILoginEvent {
  LoginEvent({required super.userName, required super.password});
}
