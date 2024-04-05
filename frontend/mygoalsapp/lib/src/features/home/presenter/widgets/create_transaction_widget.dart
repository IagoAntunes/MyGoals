import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/core/widgets/custom_textfield_widget.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/transaction/transaction_event.dart';

import '../bloc/transaction/transaction_bloc.dart';

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({
    super.key,
    required this.bloc,
    required this.goalId,
  });

  final TransactionBloc bloc;
  final int goalId;
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
                          setState(() {
                            type = "E";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: type == "E" ? Colors.green : AppColors.cGray,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color:
                                    type == "E" ? Colors.white : Colors.green,
                                size: 16,
                              ),
                              Text(
                                "Depósito",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: type == "E" ? Colors.white : null,
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
                          setState(() {
                            type = "S";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: type == "S"
                                ? Theme.of(context).colorScheme.error
                                : AppColors.cGray,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.remove,
                                color: type == "S"
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.error,
                                size: 16,
                              ),
                              Text(
                                "Saque",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: type == "S" ? Colors.white : null,
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
                            goalId: widget.goalId,
                            type: type,
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
