import 'package:mygoalsapp/src/features/home/domain/models/transaction_model.dart';

abstract class ITransactionState {
  List<TransactionModel> transactions;
  ITransactionState({
    required this.transactions,
  });
}

class IdleTransactionState extends ITransactionState {
  IdleTransactionState({required super.transactions});
}

class SuccessGetTransactionsState extends ITransactionState {
  SuccessGetTransactionsState({required super.transactions});
}
