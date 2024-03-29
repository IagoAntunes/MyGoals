enum AuthenticationStatusEnum {
  authenticated,
  unauthenticated,
  unknown,
}

abstract class IAuthState {
  AuthenticationStatusEnum status;
  IAuthState({
    required this.status,
  });
}

class AuthenticationStateStatus extends IAuthState {
  AuthenticationStateStatus({required super.status});
}
