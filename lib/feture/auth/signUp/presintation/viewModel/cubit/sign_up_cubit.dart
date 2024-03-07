import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/signUp/presintation/viewModel/cubit/sign_up_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpRegisterState> {
  SignUpCubit() : super(const SignUpRegisterState());
  void signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(signUpCreateNewAccountState: RequestState.loading));
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          "uId": userCredential.user!.uid
        });
      }
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.success,
          signUpCreateNewAccountMeassge: "Sign Up is Success"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.erorr,
          signUpCreateNewAccountMeassge: e.message));
    }
  }
}
