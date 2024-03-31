import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/core/widgets/custom_textfield_widget.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_event.dart';

class CreateGoalBottomSheet extends StatefulWidget {
  const CreateGoalBottomSheet({
    super.key,
    required this.goalBloc,
  });
  final GoalBloc goalBloc;

  @override
  State<CreateGoalBottomSheet> createState() => _CreateGoalBottomSheetState();
}

class _CreateGoalBottomSheetState extends State<CreateGoalBottomSheet> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController valueController = TextEditingController();

  String errorMessage = '';

  bool validateFields() {
    if (controller.text.isEmpty || valueController.text.isEmpty) {
      setState(() {
        errorMessage = '*Campos obrigatórios';
      });
      return false;
    } else if (int.tryParse(valueController.text) == null) {
      setState(() {
        errorMessage = 'Valor inválido';
      });
      return false;
    }
    setState(() {
      errorMessage = '';
    });
    return true;
  }

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
                const Text(
                  "Nova meta",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
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
                  controller: controller,
                  label: 'Nome',
                ),
                const SizedBox(height: 8),
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
                      if (validateFields()) {
                        widget.goalBloc.add(CreateGoalEvent(
                          title: controller.text,
                          price: int.parse(valueController.text),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "CRIAR",
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
