import 'package:bloc/bloc.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_event.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_state.dart';

class LoginBloc extends Bloc<ILoginEvent, ILoginState> {
  LoginBloc() : super(IdleLoginState()) {
    on<LoginEvent>((event, emit) {
      emit(LoadingLoginState());
      //TODO logica login

      emit(SuccessLoginState());
    });
  }
}
