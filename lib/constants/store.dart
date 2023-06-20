import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/patient.dart';

class Store {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// After Sign in Update User Information In Firebase Firestore
  Future addUser(UserModel user) async {
    fireStore.collection('users').doc(user.userId).set(
      {
        'userId': user.userId,
        'userName': user.userName,
        'userEmail': user.userEmail,
        'userPhone': user.userPhone,
        'userRole': user.userRole,
      },
    );
  }
}
