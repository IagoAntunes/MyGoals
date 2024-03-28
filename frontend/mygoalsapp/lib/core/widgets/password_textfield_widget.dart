import 'package:flutter/material.dart';

import 'custom_textfield_widget.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.enabled,
    this.hintText,
  });
  final String? label;
  final TextEditingController controller;
  final bool? enabled;
  final String? hintText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      label: widget.label,
      enabled: widget.enabled,
      prefixIcon: Icons.lock_rounded,
      obscureText: isObscure,
      keyboardType: TextInputType.visiblePassword,
      hintText: widget.hintText,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return '*obrigatório';
        }
        return null;
      },
      suffix: IconButton(
        icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
      ),
    );
  }
}
