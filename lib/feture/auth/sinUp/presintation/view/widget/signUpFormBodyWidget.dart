import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/core/widgets/customTextFormWidget.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/view/method/signUpButtonWidget.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/viewModel/cubit/sign_up_state.dart';

import 'package:flutter/material.dart';

class SignUpFormBodyWidget extends StatelessWidget {
  const SignUpFormBodyWidget(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.emailController,
      required this.confirmPasswordController,
      required this.passwordController,
      required this.state})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  final TextEditingController emailController;
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;
  final SignUpRegisterState state;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_add,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary),
              const SizedBox(height: 35),
              Text("Chat App".toUpperCase(),
                  style: const TextStyle(fontSize: 23, letterSpacing: 1.5)),
              const SizedBox(height: 25),
              CustomTextFormWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Email";
                    }
                    return null;
                  },
                  hintText: "Email",
                  obSecureText: false,
                  textEditingController: emailController),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    } else if (confirmPasswordController.text != value) {
                      return "Passwords don't match!";
                    }
                    return null;
                  },
                  hintText: "Password",
                  obSecureText: true,
                  textEditingController: passwordController),
              const SizedBox(height: 10),
              CustomTextFormWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Confirm Password";
                    } else if (value != passwordController.text) {
                      return "Passwords don't match!";
                    }
                    return null;
                  },
                  hintText: "Confirm Password",
                  obSecureText: true,
                  textEditingController: confirmPasswordController),
              const SizedBox(height: 25),
              state.signUpCreateNewAccountState == RequestState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : SignUpButtonWidget(
                      formKey: _formKey,
                      confirmPasswordController: confirmPasswordController,
                      emailController: emailController,
                      passwordController: passwordController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?  "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
