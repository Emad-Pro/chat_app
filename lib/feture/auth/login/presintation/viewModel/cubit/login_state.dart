import 'package:chat_app/core/enum/enum.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final RequestState loginRequestState;
  final String loginMessage;

  LoginState({
    this.loginRequestState = RequestState.loading,
    this.loginMessage = '',
  });
  LoginState copyWith({
    RequestState? loginRequestState,
    String? loginMessage,
  }) {
    return LoginState(
      loginMessage: loginMessage ?? this.loginMessage,
      loginRequestState: loginRequestState ?? this.loginRequestState,
    );
  }

  @override
  List<Object?> get props => [
        loginMessage,
        loginRequestState,
      ];
}
