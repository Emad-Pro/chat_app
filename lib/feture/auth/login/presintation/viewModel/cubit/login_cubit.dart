import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  void loginWidthEmailAndPassword(String email, String password) async {
    emit(state.copyWith(loginRequestState: RequestState.loading));
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(state.copyWith(loginRequestState: RequestState.success));
    }).catchError((onError) {
      emit(state.copyWith(
          loginRequestState: RequestState.erorr,
          loginMessage: onError.message));
    });
  }
}
