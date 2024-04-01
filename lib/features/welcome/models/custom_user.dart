import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  final String uid;

  CustomUser({required this.uid});

  factory CustomUser.fromFirebaseUser(User? user) {
    if(user == null) {
      return CustomUser(uid: '');
    }
    return CustomUser(uid: user.uid);
  }
}