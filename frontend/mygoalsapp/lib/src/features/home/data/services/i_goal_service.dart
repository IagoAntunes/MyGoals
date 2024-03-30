import 'package:mygoalsapp/core/response_service/response_service.dart';

import '../../domain/requests/get_goals_request.dart';

abstract class IGoalService {
  Future<IResponseService> getGoals(GetGoalsRequest request);
}
