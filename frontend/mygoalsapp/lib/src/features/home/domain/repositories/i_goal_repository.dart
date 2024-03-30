import '../../../../../core/response_service/response_service.dart';
import '../requests/get_goals_request.dart';

abstract class IGoalRepository {
  Future<IResponseService> getGoals(GetGoalsRequest request);
}
