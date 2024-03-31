import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/domain/models/transaction_model.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/i_transaction_repository.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/get_transactions_request.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionBloc extends Bloc<ITransactionEvent, ITransactionState> {
  ITransactionRepository repository;
  TransactionBloc({
    required this.repository,
  }) : super(IdleTransactionState(transactions: [])) {
    on<GetTransactionsEvent>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      var request = GetTransactionsRequest(
        userId: int.parse(userId!),
      );
      var result = await repository.getTransactions(request);
      if (result is SuccessResponseService<List<TransactionModel>>) {
        emit(SuccessGetTransactionsState(transactions: result.value));
      }
    });
    on<GetTransactionsByGoalEvent>((event, emit) async {
      var prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      var request = GetTransactionsRequest(
        userId: int.parse(userId!),
        goalId: event.goalId,
      );
      var result = await repository.getTransactions(request);
      if (result is SuccessResponseService<List<TransactionModel>>) {
        emit(SuccessGetTransactionsState(transactions: result.value));
      }
    });
  }
}
