import 'package:flutter/material.dart';

import '../../app.dart';

sealed class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.darkGreen,
      AppColors.lightGreen,
    ],
  );
}
