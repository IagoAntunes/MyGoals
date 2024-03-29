abstract class ILoginState {}

abstract class ILoginListeners extends ILoginState {}

class SuccessLoggeddLoginListener extends ILoginListeners {}

class IdleLoginState extends ILoginState {}

class SuccessLoginState extends ILoginState {}

class FailureLoginState extends ILoginState {}

class LoadingLoginState extends ILoginState {}
