import 'dart:convert';

class CreateTransactionRequest {
  int goalId;
  int vlaue;
  String userId;
  String datetime;
  String type;
  CreateTransactionRequest({
    required this.goalId,
    required this.vlaue,
    required this.userId,
    required this.datetime,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goalId': goalId,
      'vlaue': vlaue,
      'userId': userId,
      'datetime': datetime,
      'type': type,
    };
  }

  factory CreateTransactionRequest.fromMap(Map<String, dynamic> map) {
    return CreateTransactionRequest(
      goalId: map['goalId'] as int,
      vlaue: map['vlaue'] as int,
      userId: map['userId'] as String,
      datetime: map['datetime'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTransactionRequest.fromJson(String source) =>
      CreateTransactionRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
