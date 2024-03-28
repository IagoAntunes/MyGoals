import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_event.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_state.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_validations_state.dart';

class RegisterBloc extends Bloc<IRegisterEvent, IRegisterState> {
  RegisterBloc() : super(IdleRegisterState()) {
    on<RegisterEvent>((event, emit) {
      emit(LoadingRegisterState());
      //TODO
      emit(SuccessLoginRegisterListener(message: "Mensagem da API"));
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
