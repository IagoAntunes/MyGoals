import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/src/features/home/data/services/transaction_service.dart';
import 'package:mygoalsapp/src/features/home/domain/models/goal_model.dart';
import 'package:mygoalsapp/src/features/home/domain/repositories/transaction_repository.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';

import '../../../../../core/widgets/custom_textfield_widget.dart';
import '../modules/list_transactions_module.dart';

class GoalDetailPage extends StatelessWidget {
  final TransactionBloc bloc = TransactionBloc(
    repository: TransactionRepository(
      service: TransactionService(),
    ),
  );
  GoalDetailPage({
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
            const ListTransactions(),
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return CreateTransaction(bloc: bloc);
                    },
                  );
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

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({
    super.key,
    required this.bloc,
  });

  final TransactionBloc bloc;

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  bool validateField() {
    if (valueController.text.isEmpty) {
      setState(() {
        errorMessage = "campo obrigatório";
      });
      return false;
    } else if (int.tryParse(valueController.text) == null) {
      setState(() {
        errorMessage = "Valor inválido";
      });
      return false;
    } else {
      setState(() {
        errorMessage = '';
      });
      return true;
    }
  }

  String type = 'E';

  String errorMessage = '';

  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: AppColors.cGray,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Nova Transação",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    CloseButton(),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    IntrinsicWidth(
                      child: InkWell(
                        onTap: () {
                          type = "E";
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cGray,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 16,
                              ),
                              Text(
                                "Depósito",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IntrinsicWidth(
                      child: InkWell(
                        onTap: () {
                          type = "S";
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cGray.withOpacity(0.8),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.remove,
                                color: Colors.red,
                                size: 16,
                              ),
                              Text(
                                "Saque",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (errorMessage.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        errorMessage,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                CustomTextFormField(
                  controller: valueController,
                  label: 'Valor',
                  keyboardType: TextInputType.number,
                  preffix: const Text("R\$ "),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueBase,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (validateField()) {
                        widget.bloc.add(
                          CreateTransactionEvent(
                            value: int.parse(valueController.text),
                            goalId: 0,
                            type: "E",
                            datetime: DateTime.now().toString(),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "CONFIRMAR",
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
      },
    );
  }
}
