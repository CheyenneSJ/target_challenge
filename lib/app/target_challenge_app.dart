import 'package:flutter/material.dart';
import 'package:target_challenge/app/routes/routes.dart';

import 'app.dart';

//Todo: Rename App
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
