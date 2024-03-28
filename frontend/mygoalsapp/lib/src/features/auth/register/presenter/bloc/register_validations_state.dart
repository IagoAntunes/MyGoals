import 'register_state.dart';

abstract class IRegisterValidations extends IRegisterListeners {}

abstract class ISuccessRegisterValidation extends IRegisterListeners {}

abstract class IFailureRegisterValidation extends IRegisterListeners {}

class SuccessRegisterValidation extends ISuccessRegisterValidation {}

class FailureRegisterValidation extends IFailureRegisterValidation {
  IRegisterValidationState state;
  FailureRegisterValidation({
    required this.state,
  });
}

abstract class IRegisterValidationState {}

class InvalidPasswordsState extends IRegisterValidationState {}
