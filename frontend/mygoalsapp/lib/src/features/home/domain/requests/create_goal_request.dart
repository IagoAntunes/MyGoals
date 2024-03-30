// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateGoalRequest {
  int userId;
  String title;
  int price;
  int currentValue;
  CreateGoalRequest({
    required this.userId,
    required this.title,
    required this.price,
    required this.currentValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'price': price,
      'currentValue': currentValue,
    };
  }

  factory CreateGoalRequest.fromMap(Map<String, dynamic> map) {
    return CreateGoalRequest(
      userId: map['userId'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      currentValue: map['currentValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateGoalRequest.fromJson(String source) =>
      CreateGoalRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
