import 'dart:convert';

import 'package:mygoalsapp/core/response_service/response_service.dart';
import 'package:mygoalsapp/core/routes_service/app_routes_service.dart';
import 'package:mygoalsapp/src/features/home/data/services/i_goal_service.dart';
import 'package:http/http.dart' as http;
import 'package:mygoalsapp/src/features/home/domain/requests/get_goals_request.dart';
import 'package:mygoalsapp/src/features/home/domain/responses/get_goal_response.dart';

class GoalService extends IGoalService {
  @override
  Future<IResponseService> getGoals(GetGoalsRequest request) async {
    try {
      final response = await http.get(
        Uri.parse("${AppRoutesService.getGoals}?userId=${request.userId}"),
      );
      final result = jsonDecode(response.body);
      if (result['status'] == 'Sucesso') {
        return SuccessResponseService(
          message: result['message'],
          value: GetGoalResponse(
            message: result['message'],
            goals: result['goals'],
          ),
        );
      } else {
        return throw (result['message']);
      }
    } catch (e) {
      return FailureMessageResponseService(message: e.toString());
    }
  }
}
