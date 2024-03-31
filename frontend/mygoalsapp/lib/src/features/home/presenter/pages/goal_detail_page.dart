import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';

import '../modules/list_transactions_module.dart';

class GoalDetailPage extends StatelessWidget {
  const GoalDetailPage({
    super.key,
    required this.goal,
  });
  double _calculateProgress() {
    return ((goal.currentValue * 100) / goal.price) / 100;
  }

  int _calculateProgressValue() {
    return (goal.currentValue * 100) ~/ goal.price;
  }

  final Goalmodel goal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goal.title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "R\$ ${goal.currentValue} - R\$ ${goal.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
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
            const SizedBox(height: 32),
            const Text(
              "Transações",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(
              color: AppColors.cGray,
            ),
            ListTransactions(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.blueBase,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  //
                },
                child: const Text(
                  "NOVA TRANSAÇÃO",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
