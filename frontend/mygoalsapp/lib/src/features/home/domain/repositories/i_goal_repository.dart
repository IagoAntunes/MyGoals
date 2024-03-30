import 'package:mygoalsapp/src/features/home/domain/requests/create_goal_request.dart';

import '../../../../../core/response_service/response_service.dart';
import '../requests/get_goals_request.dart';

abstract class IGoalRepository {
  Future<IResponseService> getGoals(GetGoalsRequest request);
  Future<IResponseService> createGoal(CreateGoalRequest request);
}
