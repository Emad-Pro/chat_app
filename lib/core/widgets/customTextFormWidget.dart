import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.textEditingController,
      required this.obSecureText});
  final String hintText;
  final TextEditingController textEditingController;
  final bool obSecureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.tertiaryContainer,
          filled: true),
      obscureText: obSecureText,
    );
  }
}
