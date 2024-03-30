import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/src/features/home/domain/requests/create_goal_request.dart';

import '../../domain/requests/get_goals_request.dart';

abstract class IGoalService {
  Future<IResponseService> getGoals(GetGoalsRequest request);
  Future<IResponseService> createGoal(CreateGoalRequest request);
}
