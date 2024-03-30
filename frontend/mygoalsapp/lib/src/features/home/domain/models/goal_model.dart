// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Goalmodel {
  int id;
  int userId;
  String title;
  int price;
  int currentValue;
  Goalmodel({
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

  factory Goalmodel.fromMap(Map<String, dynamic> map) {
    return Goalmodel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      currentValue: map['currentValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Goalmodel.fromJson(String source) =>
      Goalmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
