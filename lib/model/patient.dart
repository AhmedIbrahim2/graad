import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? userName;

  String? userEmail;
  String? userPhone;
  String? userRole;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userRole,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : userId = snapshot['userId'],
        userName = snapshot['userName'],
        userEmail = snapshot['userEmail'],
        userPhone = snapshot['userPhone'],
        userRole = snapshot['userRole'];
}
