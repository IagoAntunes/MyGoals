import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.label,
    this.enabled,
    this.hintText,
  });
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? label;
  final bool? enabled;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        label: label == null ? null : Text(label!),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
