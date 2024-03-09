import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  // Optional fields for extended functionality
  final String? threadId; // For grouping related messages
  final List<String>? attachmentUrls; // For attachments

  MessageModel({
    required this.senderID,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    this.threadId,
    this.attachmentUrls,
  });

  // Methods for working with message data
  bool isFromUser(String userID) => senderID == userID;
  bool isToUser(String userID) => receiverId == userID;

  // Additional methods (consider these examples)
  String getFormattedTimestamp(String format) {
    // Implement logic to format timestamp based on 'format' (e.g., "dd/MM/yyyy HH:mm:ss")
    return timestamp.toString(); // Placeholder for formatting
  }

  Map<String, dynamic> toMap() {
    // Implement logic to convert MessageModel properties to a Map
    // for database storage or serialization
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      // Add other fields as needed (threadId, attachmentUrls)
    };
  }

  // Factory constructor (optional)
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    // Implement logic to create a MessageModel from a Map
    return MessageModel(
      senderID: map['senderID'] as String,
      senderEmail: map['senderEmail'] as String,
      receiverId: map['receiverId'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
      // Add additional fields if present in the map
    );
  }
}
