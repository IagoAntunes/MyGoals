import 'dart:convert';

class GoalResponse {
  String id;
  String userId;
  String title;
  int price;
  String currentValue;
  GoalResponse({
    required this.id,
    required this.userId,
    required this.title,
    required this.price,
    required this.currentValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'price': price,
      'currentValue': currentValue,
    };
  }

  factory GoalResponse.fromMap(Map<String, dynamic> map) {
    return GoalResponse(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      price: map['price'] as int,
      currentValue: map['currentValue'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalResponse.fromJson(String source) =>
      GoalResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
