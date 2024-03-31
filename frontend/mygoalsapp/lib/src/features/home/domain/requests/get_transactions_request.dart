class GetTransactionsRequest {
  int userId;
  int? goalId;
  GetTransactionsRequest({
    required this.userId,
    this.goalId,
  });
}
