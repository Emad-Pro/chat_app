import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/view/widget/signUpFormBodyWidget.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/viewModel/cubit/sign_up_cubit.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/viewModel/cubit/sign_up_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<SignUpCubit, SignUpRegisterState>(
        listener: (context, state) {
          if (state.signUpCreateNewAccountState == RequestState.success) {
            MotionToast.success(
              title: const Text(
                "SignUp",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              description: const Text("successfully registered"),
            ).show(context);
            Navigator.pop(context);
          } else if (state.signUpCreateNewAccountState == RequestState.erorr) {
            MotionToast.error(
              title: const Text(
                "SignUp",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              description: Text(state.signUpCreateNewAccountMeassge),
            ).show(context);
          }
        },
        builder: (context, state) {
          return SignUpFormBodyWidget(
              state: state,
              formKey: _formKey,
              emailController: emailController,
              confirmPasswordController: confirmPasswordController,
              passwordController: passwordController);
        },
      ),
    );
  }
}
