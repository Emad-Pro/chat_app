import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uId;
  final String email;

  UserModel({required this.uId, required this.email});

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uId: data['uId'],
      email: data['email'],
    );
  }
}
