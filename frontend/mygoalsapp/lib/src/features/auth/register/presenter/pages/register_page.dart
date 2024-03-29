import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/widgets/custom_snackbar_widget.dart';
import 'package:mygoalsapp/core/widgets/custom_textfield_widget.dart';
import 'package:mygoalsapp/core/widgets/password_textfield_widget.dart';
import 'package:mygoalsapp/src/features/auth/auth/data/service/i_auth_service.dart';
import 'package:mygoalsapp/src/features/auth/auth/domain/repositories/i_auth_repository.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_bloc.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_event.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_state.dart';
import 'package:mygoalsapp/src/features/auth/register/presenter/bloc/register_validations_state.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final registerBloc = RegisterBloc(
    authRepository: AuthRepository(
      authService: AuthService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocConsumer(
              listener: (context, state) {
                if (state is FailureRegisterValidation) {
                  switch (state.state) {
                    case InvalidPasswordsState():
                      AppSnackBars.showSimpleSnackBar(
                        context,
                        SimpleSnackbars.error(),
                      );
                      break;
                    default:
                  }
                } else if (state is SuccessRegisterValidation) {
                  registerBloc.add(
                    RegisterEvent(
                      userName: userNameController.text,
                      password: passwordController.text,
                    ),
                  );
                }
                if (state is SuccessLoginRegisterListener) {
                  AppSnackBars.showSimpleSnackBar(
                    context,
                    SimpleSnackbars.success(title: state.message),
                  );
                  Navigator.pop(context);
                } else if (state is FailureLoginRegisterListener) {
                  AppSnackBars.showSimpleSnackBar(
                    context,
                    SimpleSnackbars.error(),
                  );
                }
              },
              listenWhen: (previous, current) => current is IRegisterListeners,
              bloc: registerBloc,
              buildWhen: (previous, current) => current is IRegisterState,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text.rich(
                      TextSpan(
                        text: "Vamos fazer sua\n",
                        children: [
                          TextSpan(
                            text: "conta!",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      controller: userNameController,
                      label: 'Nome',
                      prefixIcon: Icons.person,
                      enabled: state is! LoadingRegisterState,
                      validator: (userName) {
                        if (userName == null || userName.isEmpty) {
                          return '*obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PasswordTextFormField(
                      controller: passwordController,
                      enabled: state is! LoadingRegisterState,
                      label: "Senha",
                    ),
                    const SizedBox(height: 16),
                    PasswordTextFormField(
                      controller: passwordConfirmController,
                      enabled: state is! LoadingRegisterState,
                      label: "Confirme a senha",
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            registerBloc.add(
                              ValidaRegisterEvent(
                                userName: userNameController.text,
                                password1: passwordController.text,
                                password2: passwordConfirmController.text,
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        child: state is LoadingRegisterState
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : const Text(
                                "Cadastrar",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
