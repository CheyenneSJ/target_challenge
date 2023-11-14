import 'package:flutter/material.dart';

import 'app.dart';

class TargetChallengeApp extends StatelessWidget {
  const TargetChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Target Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
