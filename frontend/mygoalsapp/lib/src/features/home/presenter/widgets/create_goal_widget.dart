import 'package:flutter/material.dart';
import 'package:mygoalsapp/core/theme/app_colors.dart';
import 'package:mygoalsapp/core/widgets/custom_textfield_widget.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_bloc.dart';
import 'package:mygoalsapp/src/features/home/presenter/bloc/goal/goal_event.dart';

class CreateGoalBottomSheet extends StatelessWidget {
  CreateGoalBottomSheet({
    super.key,
    required this.goalBloc,
  });
  final GoalBloc goalBloc;
  final TextEditingController controller = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              horizontal: 8,
            ),
            child: Form(
              key: _formKey,
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
                  CustomTextFormField(
                    autofocus: true,
                    controller: controller,
                    hintText: 'Nome da Meta',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*obrigatório';
                      }
                      return null;
                    },
                    prefixIcon: null,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    autofocus: true,
                    controller: valueController,
                    hintText: 'Valor',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*obrigatório';
                      } else if (int.tryParse(value) == null) {
                        return 'valor invalido';
                      }
                      return null;
                    },
                    prefixIcon: null,
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
                        if (_formKey.currentState!.validate()) {
                          goalBloc.add(CreateGoalEvent(
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
        });
  }
}
