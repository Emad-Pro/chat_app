import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/signUp/presintation/view/widget/signUpFormBodyWidget.dart';
import 'package:chat_app/feture/auth/signUp/presintation/viewModel/cubit/sign_up_cubit.dart';
import 'package:chat_app/feture/auth/signUp/presintation/viewModel/cubit/sign_up_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocConsumer<SignUpCubit, SignUpRegisterState>(
          listener: (context, state) {
            if (state.signUpCreateNewAccountState == RequestState.loading) {
              EasyLoading.show(
                  status: 'loading...', maskType: EasyLoadingMaskType.clear);
            }
            if (state.signUpCreateNewAccountState == RequestState.success) {
              EasyLoading.showToast("successfully registered",
                  toastPosition: EasyLoadingToastPosition.bottom);
              emailController.clear();
              passwordController.clear();
              confirmPasswordController.clear();
              Navigator.pop(context);
            } else if (state.signUpCreateNewAccountState ==
                RequestState.erorr) {
              EasyLoading.showToast(state.signUpCreateNewAccountMeassge,
                  toastPosition: EasyLoadingToastPosition.bottom);
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
      ),
    );
  }
}
