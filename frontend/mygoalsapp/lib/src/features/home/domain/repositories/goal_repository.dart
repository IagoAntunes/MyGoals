import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/data/services/i_goal_service.dart';
import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/i_goal_repository.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/create_goal_request.dart';
import 'package:mygoalsapp/src/features/home/domain/responses/get_goal_response.dart';

import '../requests/get_goals_request.dart';

class GoalRepository extends IGoalRepository {
  IGoalService goalService;
  GoalRepository({
    required this.goalService,
  });
  @override
  Future<IResponseService> getGoals(GetGoalsRequest request) async {
    var result = await goalService.getGoals(request);
    if (result is SuccessResponseService<GetGoalResponse>) {
      List<Goalmodel> listGoals = [];
      for (var item in result.value.goals) {
        listGoals.add(Goalmodel.fromMap(item));
      }
      return SuccessResponseService(
        value: listGoals,
        message: result.message,
      );
    } else {
      return result;
    }
  }

  @override
  Future<IResponseService> createGoal(CreateGoalRequest request) {
    return goalService.createGoal(request);
  }
}
