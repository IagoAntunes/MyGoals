abstract class IRegisterState {
  //
}

abstract class IRegisterListeners extends IRegisterState {}

abstract class ILoginRegisterListener extends IRegisterListeners {
  String message;
  ILoginRegisterListener({
    required this.message,
  });
}

class SuccessLoginRegisterListener extends ILoginRegisterListener {
  SuccessLoginRegisterListener({required super.message});
}

class FailureLoginRegisterListener extends ILoginRegisterListener {
  FailureLoginRegisterListener({required super.message});
}

class IdleRegisterState extends IRegisterState {}

class LoadingRegisterState extends IRegisterState {}
