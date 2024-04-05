import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/home/data/services/transaction_service.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_state.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/transaction_card_widget.dart';

import '../../domain/repositories/transaction_repository.dart';

class ListTransactions extends StatefulWidget {
  ListTransactions({
    super.key,
    this.goalId,
    this.listener,
    this.bloc,
  });
  TransactionBloc? bloc;
  final int? goalId;
  final void Function(BuildContext, ITransactionState)? listener;
  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  void initState() {
    super.initState();
    widget.bloc ??= TransactionBloc(
      repository: TransactionRepository(
        service: TransactionService(),
      ),
    );
    if (widget.goalId == null) {
      widget.bloc!.add(GetTransactionsEvent());
    } else {
      widget.bloc!.add(GetTransactionsByGoalEvent(goalId: widget.goalId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, ITransactionState>(
      listenWhen: (previous, current) => current is ITransactionListeners,
      listener: widget.listener ??
          (preview, current) {
            //
          },
      bloc: widget.bloc!,
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
