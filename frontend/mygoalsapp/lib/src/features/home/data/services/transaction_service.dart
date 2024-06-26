import 'dart:convert';

import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/data/services/i_transaction_service.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/create_transaction_request.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/get_transactions_request.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/routes_service/app_routes_service.dart';
import '../../domain/responses/get_transaction_response.dart';

class TransactionService extends ITransactionService {
  @override
  Future<IResponseService> getTransactions(
      GetTransactionsRequest request) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${AppRoutesService.getTransactions}?userId=${request.userId}",
        ),
      );
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessResponseService(
          message: result['message'],
          value: GetTransactionResponse(
            transactions: result['transactions'],
          ),
        );
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(message: e.toString());
    }
  }

  @override
  Future<IResponseService> getTransactionsByGoal(
      GetTransactionsRequest request) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${AppRoutesService.getTransactions}?userId=${request.userId}&goalId=${request.goalId}",
        ),
      );
      print(request.toJson());
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessResponseService(
          message: result['message'],
          value: GetTransactionResponse(
            transactions: result['transactions'],
          ),
        );
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(message: e.toString());
    }
  }

  @override
  Future<IResponseService> createTransaction(
      CreateTransactionRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(
          AppRoutesService.transaction,
        ),
        body: request.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessMessageResponseService(
          message: result['message'],
        );
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(message: e.toString());
    }
  }
}
