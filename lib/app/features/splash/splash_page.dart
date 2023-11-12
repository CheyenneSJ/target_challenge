import 'package:flutter/material.dart';
import 'package:target_challenge/app/core/ui/app_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Navigator.of(context).pushReplacementNamed('/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Image.asset(AppAssets.logo),
            ),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 173, 3, 3),
            ),
          ],
        ),
      ),
    );
  }
}
