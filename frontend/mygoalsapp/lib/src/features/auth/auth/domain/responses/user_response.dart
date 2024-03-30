import 'dart:convert';

class UserResponse {
  String token;
  int userId;
  UserResponse({
    required this.token,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'userId': userId,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      token: map['token'] as String,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
