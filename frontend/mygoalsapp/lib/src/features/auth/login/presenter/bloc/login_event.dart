abstract class ILoginEvent {
  String email;
  String password;
  ILoginEvent({
    required this.email,
    required this.password,
  });
}

class LoginEvent extends ILoginEvent {
  LoginEvent({required super.email, required super.password});
}
