import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/home/data/model/userModel.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.signOutRequestState = RequestState.normal,
      this.userModel,
      this.userState = HomeRequestState.loading});
  final RequestState signOutRequestState;
  final List<UserModel>? userModel;
  final HomeRequestState userState;
  HomeState copyWith(
      {RequestState? signOutRequestState,
      List<UserModel>? userModel,
      HomeRequestState? userState}) {
    return HomeState(
        signOutRequestState: signOutRequestState ?? this.signOutRequestState,
        userModel: userModel ?? this.userModel,
        userState: userState ?? this.userState);
  }

  @override
  List<Object?> get props => [signOutRequestState, userState, userModel];
}
