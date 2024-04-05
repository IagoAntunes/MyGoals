import 'package:mygoalsapp/src/features/home/domain/models/transaction_model.dart';

abstract class ITransactionState {
  List<TransactionModel> transactions;
  ITransactionState({
    required this.transactions,
  });
}

abstract class ITransactionListeners extends ITransactionState {
  ITransactionListeners({required super.transactions});
}

class SuccessPostTransactionListener extends ITransactionListeners {
  SuccessPostTransactionListener({required super.transactions});
}

class IdleTransactionState extends ITransactionState {
  IdleTransactionState({required super.transactions});
}

class SuccessGetTransactionsState extends ITransactionState {
  SuccessGetTransactionsState({required super.transactions});
}
