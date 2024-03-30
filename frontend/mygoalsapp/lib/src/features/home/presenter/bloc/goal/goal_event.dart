abstract class IGoalEvent {}

class GetGoalsEvent extends IGoalEvent {}

class CreateGoalEvent extends IGoalEvent {
  String title;
  int price;
  CreateGoalEvent({
    required this.title,
    required this.price,
  });
}
