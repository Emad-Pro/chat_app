import 'package:chat_app/core/enum/enum.dart';

class SignUpRegisterState {
  final RequestState signUpCreateNewAccountState;
  final String signUpCreateNewAccountMeassge;
  const SignUpRegisterState(
      {this.signUpCreateNewAccountState = RequestState.normal,
      this.signUpCreateNewAccountMeassge = ''});

  SignUpRegisterState copyWith(
      {RequestState? signUpCreateNewAccountState,
      String? signUpCreateNewAccountMeassge}) {
    return SignUpRegisterState(
      signUpCreateNewAccountState:
          signUpCreateNewAccountState ?? this.signUpCreateNewAccountState,
      signUpCreateNewAccountMeassge:
          signUpCreateNewAccountMeassge ?? this.signUpCreateNewAccountMeassge,
    );
  }

  @override
  List<Object> get props =>
      [signUpCreateNewAccountMeassge, signUpCreateNewAccountState];
}
