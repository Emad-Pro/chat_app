part of 'chat_cubit.dart';

class ChatState {
  const ChatState(
      {this.messages,
      this.messagesRequestState = RequestState.normal,
      this.currentUser});
  final List<ChatMessage>? messages;
  final RequestState messagesRequestState;
  final ChatUser? currentUser;
  ChatState copyWith(
      {List<ChatMessage>? messages,
      RequestState? messagesRequestState,
      ChatUser? currentUser}) {
    return ChatState(
        messages: messages ?? this.messages,
        messagesRequestState: messagesRequestState ?? this.messagesRequestState,
        currentUser: currentUser ?? this.currentUser);
  }
}
