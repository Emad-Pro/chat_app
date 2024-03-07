import 'dart:async';

import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/home/data/model/userModel.dart';
import 'package:chat_app/feture/home/presentation/viewModel/cubit/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  signOutMethod() {
    emit(state.copyWith(signOutRequestState: RequestState.loading));
    FirebaseAuth.instance.signOut().then((value) {
      emit(state.copyWith(signOutRequestState: RequestState.success));
    }).catchError((onError) {
      emit(state.copyWith(signOutRequestState: RequestState.erorr));
    });
  }

  StreamSubscription? streamSubscription;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void listenToUsers() {
    emit(state.copyWith(userState: HomeRequestState.loading));
    final usersStream = firestore.collection("users").snapshots();
    streamSubscription = usersStream.listen((snapshot) {
      final users =
          snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
      emit(state.copyWith(
          userState: HomeRequestState.success, userModel: users));
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
