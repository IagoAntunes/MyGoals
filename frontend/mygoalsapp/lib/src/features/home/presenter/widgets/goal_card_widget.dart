import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';
import 'package:mygoalsapp/src/features/home/presenter/pages/goal_detail_page.dart';

class GoalCardWidget extends StatelessWidget {
  const GoalCardWidget({
    super.key,
    required this.goal,
  });

  final Goalmodel goal;
  double _calculateProgress() {
    return ((goal.currentValue * 100) / goal.price) / 100;
  }

  int _calculateProgressValue() {
    return (goal.currentValue * 100) ~/ goal.price;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoalDetailPage(
              goal: goal,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          width: 148,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goal.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "R\$ ${goal.currentValue.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "de R\$ ${goal.price.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff7C7C8A),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: AppColors.cGray,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedFractionallySizedBox(
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.centerLeft,
                          widthFactor: _calculateProgress(),
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32),
                              ),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 1,
                          bottom: 1,
                          child: Text(
                            "${_calculateProgressValue()}%",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
