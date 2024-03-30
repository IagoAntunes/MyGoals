import 'package:mygoalsapp/core/response_service/response_service.dart';

import '../requests/get_transactions_request.dart';

abstract class ITransactionRepository {
  Future<IResponseService> getTransactions(GetTransactionsRequest request);
}
