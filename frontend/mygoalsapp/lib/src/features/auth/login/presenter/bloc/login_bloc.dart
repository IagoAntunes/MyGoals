import 'package:bloc/bloc.dart';
import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/auth/login/domain/request/login_user_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mygoalsapp/src/features/auth/auth/domain/repositories/i_auth_repository.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_event.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_state.dart';

class LoginBloc extends Bloc<ILoginEvent, ILoginState> {
  IAuthRepository authRepository;
  LoginBloc({
    required this.authRepository,
  }) : super(IdleLoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingLoginState());
      var request =
          LoginUserRequest(userName: event.userName, password: event.password);
      var result = await authRepository.login(request);
      if (result is SuccessMessageResponseService) {
        var prefs = await SharedPreferences.getInstance();
        await prefs.setBool("isLogged", true);
        //TODO Emitir auth
        emit(SuccessLoggeddLoginListener());
        emit(SuccessLoginState());
      } else if (result is FailureMessageResponseService) {
        emit(FailureLoginState());
      }
    });
  }
}
