import 'package:chat_app/core/widgets/customButtonWidget.dart';
import 'package:chat_app/core/widgets/customTextFormWidget.dart';

import 'package:chat_app/feture/auth/login/presintation/view/widget/LoginScreeRedisterNowWidget.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_cubit.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // signInListenerMethod(state, context);
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
                  //  state.signInRequestState == RequestState.loading
                  //    ? const Center(child: CircularProgressIndicator())
                  CustomButtonWidget(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        //     BlocProvider.of<SignInBloc>(context).add(
                        //       NewSignInEvent(emailController.text,
                        //         passwordController.text));
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
    );
  }
}
