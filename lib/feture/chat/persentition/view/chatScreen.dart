import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/chat/persentition/viewModel/cubit/chat_cubit.dart';
import 'package:chat_app/feture/home/data/model/userModel.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final UserModel user;

  const ChatScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()
        ..initalChatCurrentUser()
        ..firestoreToChatMessageStream(
            FirebaseAuth.instance.currentUser!.uid, user.uId),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(user.email),
          actions: [],
        ),
        body: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.messagesRequestState) {
                case RequestState.normal:
                  return const Center(child: CircularProgressIndicator());

                case RequestState.loading:
                  return const CircularProgressIndicator();
                case RequestState.success:
                  return DashChat(
                    messageListOptions: const MessageListOptions(),
                    inputOptions: const InputOptions(
                      showTraillingBeforeSend: true,
                      inputTextStyle: TextStyle(color: Colors.red),
                      inputToolbarStyle: BoxDecoration(shape: BoxShape.circle),
                    ),
                    messageOptions: MessageOptions(
                        currentUserTextColor: Colors.white,
                        currentUserContainerColor: Colors.purple[700],
                        textColor: Colors.white,
                        containerColor: const Color.fromARGB(255, 69, 90, 100),
                        showCurrentUserAvatar: true,
                        showTime: true),
                    currentUser: state.currentUser!,
                    onSend: (ChatMessage e) {
                      BlocProvider.of<ChatCubit>(context)
                          .sendMessage(user.uId, e.text);
                    },
                    messages: state.messages!,
                  );

                case RequestState.erorr:
                  return const Text("");
              }
            }),
      ),
    );
  }
}
