import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_state.dart';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void signInListenerMethod(LoginState state, BuildContext context) {
  if (state.loginRequestState == RequestState.success) {
    MotionToast.success(
      title: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text("Successfully Login"),
    ).show(context);
    Navigator.pushNamed(context, "/homeScreen");
  } else if (state.loginRequestState == RequestState.erorr) {
    MotionToast.error(
      title: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(state.loginMessage),
    ).show(context);
  }
}
