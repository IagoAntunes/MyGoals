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
