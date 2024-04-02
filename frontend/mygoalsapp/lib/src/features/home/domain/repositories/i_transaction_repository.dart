import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/create_transaction_request.dart';

import '../requests/get_transactions_request.dart';

abstract class ITransactionRepository {
  Future<IResponseService> getTransactions(GetTransactionsRequest request);
  Future<IResponseService> createTransaction(CreateTransactionRequest request);
}
