import 'package:bloc/bloc.dart';
import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/chat/data/model/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserID = firebaseAuth.currentUser!.uid;

    List<String> ids = [currentUserID, receiverId];
    ids.sort();
    String chatRomsId = ids.join("_");
    await firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRomsId)
        .collection("messages")
        .add(ChatMessage(
                user: ChatUser(id: firebaseAuth.currentUser!.uid),
                createdAt: DateTime.now(),
                text: message)
            .toJson());
  }

  initalChatCurrentUser() {
    return emit(state.copyWith(
        currentUser: ChatUser(id: firebaseAuth.currentUser!.uid)));
  }

  firestoreToChatMessageStream(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String roomid = ids.join("_");
    firebaseFirestore
        .collection("chat_rooms")
        .doc(roomid)
        .collection("messages")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .listen((querySnapshot) {
      final List<ChatMessage> response = querySnapshot.docs
          .map((doc) => ChatMessage.fromJson(doc.data()))
          .toList();
      emit(state.copyWith(
          messages: response, messagesRequestState: RequestState.success));
    });
  }
}
