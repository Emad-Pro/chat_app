import 'package:chat_app/core/widgets/customButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.confirmPasswordController,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController confirmPasswordController;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          if (confirmPasswordController.text ==
              confirmPasswordController.text) {
            //   BlocProvider.of<SignUpBloc>(context).add(
            //     SignupCreateNewAccountEvent(userNameController.text,
            //       emailController.text, passwordController.text));
          }
        }
      },
      text: "SignUp",
    );
  }
}
