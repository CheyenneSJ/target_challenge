import 'package:flutter/material.dart';

import 'app.dart';

//Todo: Rename App
class TargetChallengeApp extends StatelessWidget {
  const TargetChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Todo: Rename App
      title: 'Target Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
