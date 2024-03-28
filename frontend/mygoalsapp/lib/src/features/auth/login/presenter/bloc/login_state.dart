abstract class ILoginState {}

class IdleLoginState extends ILoginState {}

class SuccessLoginState extends ILoginState {}

class FailureLoginState extends ILoginState {}

class LoadingLoginState extends ILoginState {}
