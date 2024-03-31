import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/get_transactions_request.dart';

abstract class ITransactionService {
  Future<IResponseService> getTransactions(GetTransactionsRequest request);
  Future<IResponseService> getTransactionsByGoal(
    GetTransactionsRequest request,
  );
}
