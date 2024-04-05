import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/src/features/home/presenter/modules/list_goals_module.dart';

import '../modules/list_transactions_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Suas metas",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Poupe hoje para colher os frutos amanhã.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              ListGoals(),
              const SizedBox(height: 48),
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
              const SizedBox(height: 16),
              ListTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
