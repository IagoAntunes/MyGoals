import 'dart:convert';

class GetTransactionsRequest {
  int userId;
  int? goalId;
  GetTransactionsRequest({
    required this.userId,
    this.goalId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'goalId': goalId,
    };
  }

  factory GetTransactionsRequest.fromMap(Map<String, dynamic> map) {
    return GetTransactionsRequest(
      userId: map['userId'] as int,
      goalId: map['goalId'] != null ? map['goalId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTransactionsRequest.fromJson(String source) =>
      GetTransactionsRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
