import 'dart:convert';

import 'package:mygoalsapp/core/routes_service/app_routes_service.dart';
import 'package:mygoalsapp/src/features/auth/auth/domain/responses/login_user_response.dart';
import 'package:mygoalsapp/src/features/auth/login/domain/request/register_user_request.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/response_service/response_service.dart';
import '../../../login/domain/request/login_user_request.dart';

abstract class IAuthService {
  Future<IResponseService> registerUser(RegisterUserRequest userRequest);
  Future<IResponseService> login(LoginUserRequest userRequest);
}

class AuthService extends IAuthService {
  @override
  Future<IResponseService> registerUser(RegisterUserRequest userRequest) async {
    try {
      final response = await http.post(
        Uri.parse(AppRoutesService.userRegisterUrl),
        body: userRequest.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessMessageResponseService(message: result['message']);
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(message: e.toString());
    }
  }

  @override
  Future<IResponseService> login(LoginUserRequest loginRequest) async {
    try {
      final response = await http.post(
        Uri.parse(AppRoutesService.userLoginUrl),
        body: loginRequest.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessResponseService(
          message: result['message'],
          value: LoginUserResponse(
            user: result['user'],
          ),
        );
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(
        message: e.toString(),
      );
    }
  }
}
