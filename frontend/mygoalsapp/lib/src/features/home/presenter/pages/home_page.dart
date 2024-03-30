import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/core/widgets/custom_snackbar_widget.dart';
import 'package:mygoalsapp/src/features/home/data/services/goal_service.dart';
import 'package:mygoalsapp/src/features/home/data/services/transaction_service.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/goal_repository.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/transaction_repository.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_state.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/home/home_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/home/home_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_state.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/create_goal_widget.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/goal_card_widget.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/transaction_card_widget.dart';

import '../bloc/home/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc(
    IdleHomeState(),
    goalBloc: GoalBloc(
      IdleGoalState(),
      goalRepository: GoalRepository(
        goalService: GoalService(),
      ),
    ),
    transactionBloc: TransactionBloc(
      repository: TransactionRepository(
        service: TransactionService(),
      ),
    ),
  );
  @override
  void initState() {
    super.initState();
    homeBloc.add(GetValuesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: BlocProvider(
            create: (context) => homeBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Suas metas",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Poupe hoje para colher os frutos amanhã.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                BlocProvider(
                  create: (context) => homeBloc.goalBloc,
                  child: Builder(builder: (context) {
                    return BlocConsumer(
                      listener: (context, state) {
                        if (state is CreatedGoalListener) {
                          AppSnackBars.showSimpleSnackBar(
                            context,
                            SimpleSnackbars.success(title: state.message),
                          );
                          homeBloc.goalBloc.add(GetGoalsEvent());
                        }
                      },
                      bloc: homeBloc.goalBloc,
                      builder: (context, state) {
                        return switch (state) {
                          (LoadingGetGoalState _) =>
                            const CircularProgressIndicator(),
                          (SuccessGetGoalState successState) => SizedBox(
                              height: 164,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FilledButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) =>
                                            CreateGoalBottomSheet(
                                          goalBloc: homeBloc.goalBloc,
                                        ),
                                      );
                                    },
                                    style: FilledButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: successState.listGoals.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          GoalCardWidget(
                                        goal: successState.listGoals[index],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          _ => Container(),
                        };
                      },
                    );
                  }),
                ),
                const SizedBox(height: 48),
                const Text(
                  "Transações",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: AppColors.cGray,
                ),
                const SizedBox(height: 16),
                BlocBuilder<TransactionBloc, ITransactionState>(
                  bloc: homeBloc.transactionBloc,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
