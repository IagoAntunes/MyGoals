abstract class ITransactionEvent {}

class GetTransactionsEvent extends ITransactionEvent {
  GetTransactionsEvent();
}

class GetTransactionsByGoalEvent extends ITransactionEvent {
  int goalId;
  GetTransactionsByGoalEvent({
    required this.goalId,
  });
}

class CreateTransactionEvent extends ITransactionEvent {
  int goalId;
  int value;
  String type;
  String datetime;
  CreateTransactionEvent({
    required this.goalId,
    required this.value,
    required this.type,
    required this.datetime,
  });
}
