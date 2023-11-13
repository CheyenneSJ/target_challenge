import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:validatorless/validatorless.dart';

import '../../app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final controller = sl<LoginController>();
  final nameEc = TextEditingController();
  final passwordEc = TextEditingController();

  @override
  void initState() {
    reaction((_) => controller.currentState, (LoginState state) {
      switch (state) {
        case LoginState.success:
          Navigator.of(context).pushReplacementNamed('/home');

          break;
        case LoginState.error:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro, usuário e senha estão errados.'),
            ),
          );

        case LoginState.initial:
        case LoginState.loading:
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        height: size.height,
        width: size.width,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      label: 'Usuário',
                      icon: Icons.person,
                      controller: nameEc,
                      validator: Validatorless.multiple([
                        Validatorless.required('O campo não pode estar vazio.'),
                        Validatorless.max(20,
                            'O campo de usuário tem o limite de 20 caracteres.'),
                        Validatorless.min(2,
                            'O campo senha precisa ter mais que 2 caracteres.'),
                        Validatorless.regex(RegExp(r'^[a-zA-Z0-9_]+\S$'),
                            'Não pode ter caracteres em branco.')
                      ]),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      label: 'Senha',
                      icon: Icons.lock,
                      controller: passwordEc,
                      obscureText: true,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                              'O campo não pode estar vazio.'),
                          Validatorless.min(2,
                              'O campo senha precisa ter mais que 2 caracteres.'),
                          Validatorless.max(20,
                              'O campo senha tem o limite de 20 caracteres.'),
                          Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+\S$'),
                              'Apenas letras e números, não use caracteres especiais.')
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.login(
                                name: nameEc.text,
                                password: passwordEc.text,
                              );
                            } else {
                              print('Invalid');
                            }
                          },
                          child: controller.currentState == LoginState.loading
                              ? const SizedBox.square(
                                  dimension: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : const Text('Entrar'),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => launchUrlString('https://google.com.br'),
                child: const Text('Política de Privacidade'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
