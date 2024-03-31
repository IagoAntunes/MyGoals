import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/home/data/services/transaction_service.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_state.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/transaction_card_widget.dart';

import '../../domain/repositories/transaction_repository.dart';

class ListTransactions extends StatefulWidget {
  const ListTransactions({
    super.key,
    this.goalId,
  });
  final int? goalId;
  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  void initState() {
    super.initState();
    if (widget.goalId == null) {
      bloc.add(GetTransactionsEvent());
    } else {
      bloc.add(GetTransactionsByGoalEvent(goalId: widget.goalId!));
    }
  }

  final bloc = TransactionBloc(
    repository: TransactionRepository(
      service: TransactionService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, ITransactionState>(
      bloc: bloc,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (context, index) => TransactionCardWidget(
              transaction: state.transactions[index],
            ),
          ),
        );
      },
    );
  }
}
