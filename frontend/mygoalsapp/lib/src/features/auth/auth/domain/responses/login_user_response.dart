import 'dart:convert';

import 'package:mygoalsapp/src/features/auth/auth/domain/responses/user_response.dart';

class LoginUserResponse {
  Map user;
  late UserResponse userResponse;
  LoginUserResponse({
    required this.user,
  }) {
    userResponse = UserResponse(token: user['token'], userId: user['userId']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
    };
  }

  factory LoginUserResponse.fromMap(Map<String, dynamic> map) {
    return LoginUserResponse(
      user: Map.from(
        (map['user'] as Map),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserResponse.fromJson(String source) =>
      LoginUserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
