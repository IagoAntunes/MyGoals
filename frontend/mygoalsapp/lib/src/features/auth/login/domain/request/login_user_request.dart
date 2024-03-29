import 'dart:convert';

class LoginUserRequest {
  String userName;
  String password;
  LoginUserRequest({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
    };
  }

  factory LoginUserRequest.fromMap(Map<String, dynamic> map) {
    return LoginUserRequest(
      userName: map['userName'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserRequest.fromJson(String source) =>
      LoginUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
