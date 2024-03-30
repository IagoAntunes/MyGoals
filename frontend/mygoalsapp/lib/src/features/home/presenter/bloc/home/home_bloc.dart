import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<IHomeEvent, IHomeState> {
  GoalBloc goalBloc;
  TransactionBloc transactionBloc;

  HomeBloc(
    super.initialState, {
    required this.goalBloc,
    required this.transactionBloc,
  }) {
    on<GetValuesEvent>((event, emit) {
      goalBloc.add(GetGoalsEvent());
      transactionBloc.add(GetTransactionsEvent());
    });
  }
}
