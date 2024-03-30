import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/src/features/home/domain/models/transaction_model.dart';

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({
    super.key,
    required this.transaction,
  });
  final TransactionModel transaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        color: AppColors.card,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            if (transaction.type == "E")
              Text(
                "+ R\$ ${transaction.value}",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            if (transaction.type == "S")
              Text(
                "- R\$ ${transaction.value}",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            const Spacer(),
            Text(
              transaction.date,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff7C7C8A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
