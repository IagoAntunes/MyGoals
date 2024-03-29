import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/auth/auth/auth_event.dart';
import 'package:mygoalsapp/src/features/auth/auth/auth_state.dart';

class AuthBloc extends Bloc<IAuthEvent, IAuthState> {
  AuthBloc(super.initialState) {
    on<LoggeddAuthEvent>((event, emit) {
      emit(
        AuthenticationStateStatus(
          status: AuthenticationStatusEnum.authenticated,
        ),
      );
    });
  }
}
