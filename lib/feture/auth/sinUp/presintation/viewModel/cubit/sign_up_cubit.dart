import 'package:chat_app/feture/auth/sinUp/presintation/viewModel/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpRegisterState> {
  SignUpCubit() : super(const SignUpRegisterState());
}

 /*   try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          "userName": event.userName,
        });
      }
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.success,
          signUpCreateNewAccountMeassge: "Sign Up is Success"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          signUpCreateNewAccountState: RequestState.erorr,
          signUpCreateNewAccountMeassge: e.message));
    }*/