import 'dart:convert';

class RegisterUserRequest {
  String username;
  String password;
  RegisterUserRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory RegisterUserRequest.fromMap(Map<String, dynamic> map) {
    return RegisterUserRequest(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserRequest.fromJson(String source) =>
      RegisterUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
