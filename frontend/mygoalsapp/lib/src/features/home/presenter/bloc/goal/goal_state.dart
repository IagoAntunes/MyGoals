import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';

abstract class IGoalState {
  List<Goalmodel> listGoals;
  IGoalState({
    required this.listGoals,
  });
}

class IdleGoalState extends IGoalState {
  IdleGoalState() : super(listGoals: []);
}

class SuccessGetGoalState extends IGoalState {
  SuccessGetGoalState({required super.listGoals});
}

class LoadingGetGoalState extends IGoalState {
  LoadingGetGoalState() : super(listGoals: []);
}
