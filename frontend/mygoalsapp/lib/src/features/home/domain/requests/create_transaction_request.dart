import 'dart:convert';

class CreateTransactionRequest {
  int goalId;
  int value;
  String userId;
  String datetime;
  String type;
  CreateTransactionRequest({
    required this.goalId,
    required this.value,
    required this.userId,
    required this.datetime,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'goalId': goalId,
      'value': value,
      'date': datetime,
      'type': type,
    };
  }

  factory CreateTransactionRequest.fromMap(Map<String, dynamic> map) {
    return CreateTransactionRequest(
      goalId: map['goalId'] as int,
      value: map['value'] as int,
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
