import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/widgets/custom_snackbar_widget.dart';
import 'package:mygoalsapp/src/features/home/data/services/goal_service.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/goal_repository.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_event.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_state.dart';
import 'package:mygoalsapp/src/features/home/presenter/widgets/goal_card_widget.dart';

import '../widgets/create_goal_widget.dart';

class ListGoals extends StatelessWidget {
  ListGoals({
    super.key,
  });

  final GoalBloc bloc = GoalBloc(
    IdleGoalState(),
    goalRepository: GoalRepository(
      goalService: GoalService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is CreatedGoalListener) {
          AppSnackBars.showSimpleSnackBar(
            context,
            SimpleSnackbars.success(title: state.message),
          );
          bloc.add(GetGoalsEvent());
        }
      },
      bloc: bloc,
      builder: (context, state) {
        return switch (state) {
          (LoadingGetGoalState _) => const CircularProgressIndicator(),
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
                        builder: (context) => CreateGoalBottomSheet(
                          goalBloc: bloc,
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
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      padding: EdgeInsets.zero,
                      itemCount: successState.listGoals.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GoalCardWidget(
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
  }
}
