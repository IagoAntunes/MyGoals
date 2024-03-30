import 'package:mygoalsapp/src/features/auth/auth/data/service/i_auth_service.dart';
import 'package:mygoalsapp/src/features/auth/login/domain/request/login_user_request.dart';

import '../../../../../../core/response_service/response_service.dart';
import '../../../login/domain/request/register_user_request.dart';
import '../responses/login_user_response.dart';

abstract class IAuthRepository {
  Future<IResponseService> registerUser(RegisterUserRequest userRequest);
  Future<IResponseService> login(LoginUserRequest loginRequest);
}

class AuthRepository extends IAuthRepository {
  IAuthService authService;
  AuthRepository({
    required this.authService,
  });
  @override
  Future<IResponseService> registerUser(RegisterUserRequest userRequest) {
    return authService.registerUser(userRequest);
  }

  @override
  Future<IResponseService> login(LoginUserRequest loginRequest) async {
    var result = await authService.login(loginRequest);
    if (result is SuccessResponseService<LoginUserResponse>) {
      return result;
    } else {
      return result;
    }
  }
}
