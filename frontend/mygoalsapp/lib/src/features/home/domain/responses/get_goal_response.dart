import 'package:mygoalsapp/core/response_service/response_service.dart';

class GetGoalResponse extends IResponseService {
  List<dynamic> goals;
  GetGoalResponse({
    required super.message,
    required this.goals,
  });
}
