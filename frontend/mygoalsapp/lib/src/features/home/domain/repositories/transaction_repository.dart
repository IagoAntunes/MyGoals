import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/data/services/i_transaction_service.dart';
import 'package:mygoalsapp/src/features/home/domain/models/transaction_model.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/i_transaction_repository.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/get_transactions_request.dart';

import '../responses/get_transaction_response.dart';

class TransactionRepository extends ITransactionRepository {
  ITransactionService service;
  TransactionRepository({
    required this.service,
  });
  @override
  Future<IResponseService> getTransactions(
      GetTransactionsRequest request) async {
    late IResponseService result;
    if (request.goalId == null) {
      result = await service.getTransactions(request);
    } else {
      result = await service.getTransactionsByGoal(request);
    }
    if (result is SuccessResponseService<GetTransactionResponse>) {
      List<TransactionModel> transactions = [];
      for (var t in result.value.transactions) {
        transactions.add(TransactionModel.fromMap(t));
      }
      return SuccessResponseService(
        value: transactions,
        message: result.message,
      );
    } else {
      return result;
    }
  }
}
