import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/core/widgets/password_textfield_widget.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_bloc.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_event.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/bloc/login_state.dart';

import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../register/presenter/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final loginBloc = LoginBloc();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocBuilder<LoginBloc, ILoginState>(
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
                      label: 'Email',
                      hintText: 'example@.com.br',
                      controller: emailController,
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      enabled: state is! LoadingLoginState,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return "*obrigatório";
                        } else if (!email.contains('@')) {
                          return 'email inválido';
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
                                email: emailController.text,
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
