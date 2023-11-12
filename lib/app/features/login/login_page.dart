import 'package:flutter/material.dart';

import '../../app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppTextField(
                    label: 'Usuário',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 24),
                  const AppTextField(
                    label: 'Senha',
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 40,
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: const Text('Entrar'),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Política de Privacidade'),
            ),
          ],
        ),
      ),
    );
  }
}
