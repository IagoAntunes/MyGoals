import 'dart:convert';

class TransactionModel {
  int id;
  int goalId;
  String value;
  String date;
  String type;
  TransactionModel({
    required this.id,
    required this.goalId,
    required this.value,
    required this.date,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'goalId': goalId,
      'value': value,
      'date': date,
      'type': type,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as int,
      goalId: map['goalId'] as int,
      value: map['value'] as String,
      date: map['date'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
