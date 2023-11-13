import 'package:flutter/material.dart';

import '../app.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.label,
    this.icon,
    this.hintText,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14),
        ),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: false,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,

            prefixIcon: icon != null ? Icon(icon) : null,
            isDense: true,
            // errorText: 'Erro',
          ),
        ),
      ],
    );
  }
}
