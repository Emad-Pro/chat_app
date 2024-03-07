import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/core/widgets/customButtonWidget.dart';
import 'package:chat_app/core/widgets/customTextFormWidget.dart';
import 'package:chat_app/feture/auth/login/presintation/view/method/signInListenerMethod.dart';

import 'package:chat_app/feture/auth/login/presintation/view/widget/LoginScreeRedisterNowWidget.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_cubit.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_state.dart';
import 'package:chat_app/feture/home/presentation/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.loginRequestState == RequestState.loading) {
              EasyLoading.show(
                  status: 'loading...', maskType: EasyLoadingMaskType.clear);
            }
            if (state.loginRequestState == RequestState.success) {
              EasyLoading.showToast("Successfully Login",
                  toastPosition: EasyLoadingToastPosition.bottom);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            } else if (state.loginRequestState == RequestState.erorr) {
              EasyLoading.showToast(state.loginMessage,
                  toastPosition: EasyLoadingToastPosition.bottom);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      size: 80,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chat App".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
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
                          }
                          return null;
                        },
                        hintText: "Password",
                        obSecureText: true,
                        textEditingController: passwordController),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButtonWidget(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .loginWidthEmailAndPassword(emailController.text,
                                  passwordController.text);
                        }
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginScreeRedisterNowWidget()
                  ],
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
