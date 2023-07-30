import 'package:flutter/material.dart';

class SubmitTextFormField extends StatelessWidget {
  const SubmitTextFormField({
    super.key,
    this.hintText,
    this.submitted,
    required this.onSubmit,
    this.validator,
    this.obscuringText = false
  });

  final String? hintText;
  final bool? submitted;
  final ValueChanged<String> onSubmit;
  final String? Function(String?)? validator;
  final bool obscuringText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText
      ),
      autovalidateMode: submitted!
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: validator,
      onChanged: (text) => onSubmit(text),
      obscureText: obscuringText,
    );
  }
}