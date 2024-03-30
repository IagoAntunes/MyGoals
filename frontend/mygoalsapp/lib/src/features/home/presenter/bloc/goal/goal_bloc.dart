import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';

import 'package:mygoalsapp/src/features/home/domain/repositories/i_goal_repository.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/get_goals_request.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'goal_event.dart';

class GoalBloc extends Bloc<IGoalEvent, IGoalState> {
  IGoalRepository goalRepository;
  GoalBloc(super.initialState, {required this.goalRepository}) {
    on<GetGoalsEvent>((event, emit) async {
      emit(LoadingGetGoalState());
      var prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      var request = GetGoalsRequest(userId: userId!);
      var result = await goalRepository.getGoals(request);
      if (result is SuccessResponseService<List<Goalmodel>>) {
        emit(SuccessGetGoalState(listGoals: result.value));
      }
    });
  }
}
