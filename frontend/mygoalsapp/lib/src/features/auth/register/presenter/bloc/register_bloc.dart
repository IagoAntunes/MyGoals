import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/auth/auth/domain/repositories/i_auth_repository.dart';
import 'package:mygoalsapp/src/features/auth/login/domain/request/register_user_request.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_event.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_state.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_validations_state.dart';

class RegisterBloc extends Bloc<IRegisterEvent, IRegisterState> {
  IAuthRepository authRepository;
  RegisterBloc({
    required this.authRepository,
  }) : super(IdleRegisterState()) {
    on<RegisterEvent>((event, emit) async {
      emit(LoadingRegisterState());
      var request = RegisterUserRequest(
        username: event.userName,
        password: event.password,
      );
      var result = await authRepository.registerUser(request);
      if (result is SuccessMessageResponseService) {
        emit(SuccessLoginRegisterListener(message: result.message));
      } else if (result is FailureMessageResponseService) {
        emit(FailureLoginRegisterListener(message: result.message));
      }
    });
    on<ValidaRegisterEvent>(
      (event, emit) {
        add(
          ValidaPasswordsEvent(
            password1: event.password1,
            password2: event.password2,
          ),
        );
      },
    );
    on<ValidaPasswordsEvent>(
      (event, emit) {
        if (event.password1 != event.password2) {
          emit(FailureRegisterValidation(state: InvalidPasswordsState()));
        } else {
          emit(SuccessRegisterValidation());
        }
      },
    );
  }
}
