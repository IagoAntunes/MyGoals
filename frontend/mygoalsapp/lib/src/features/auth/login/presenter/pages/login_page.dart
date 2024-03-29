import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/widgets/password_textfield_widget.dart';
import 'package:mygoalsapp/src/features/auth/auth/auth_bloc.dart';
import 'package:mygoalsapp/src/features/auth/auth/data/service/i_auth_service.dart';
import 'package:mygoalsapp/src/features/auth/auth/domain/repositories/i_auth_repository.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_bloc.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_event.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_state.dart';

import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../auth/auth_event.dart';
import '../../../register/presenter/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final loginBloc = LoginBloc(
    authRepository: AuthRepository(
      authService: AuthService(),
    ),
  );

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocConsumer<LoginBloc, ILoginState>(
              listenWhen: (previous, current) => current is ILoginListeners,
              listener: (context, state) {
                if (state is SuccessLoggeddLoginListener) {
                  BlocProvider.of<AuthBloc>(context).add(
                    LoggeddAuthEvent(),
                  );
                }
              },
              bloc: loginBloc,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                    ),
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
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      label: 'Nome',
                      hintText: 'Seu nome...',
                      controller: userNameController,
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                      enabled: state is! LoadingLoginState,
                      validator: (userName) {
                        if (userName == null || userName.isEmpty) {
                          return "*obrigatório";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    PasswordTextFormField(
                      label: 'Senha',
                      hintText: '*****',
                      controller: passwordController,
                      enabled: state is! LoadingLoginState,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginBloc.add(
                              LoginEvent(
                                userName: userNameController.text,
                                password: passwordController.text,
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
                        child: loginBloc.state is LoadingLoginState
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Alinha os widgets ao topo da Row
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Não possui uma conta?  "),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
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
