import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_welcome_app/features/welcome/models/custom_user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in with email & password
  Future signInByEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      return user;
    } catch(e) {
      // print(e.toString());
      return null;
    }
  }
  //auth change user stream
  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(CustomUser.fromFirebaseUser);
  }
  //sign up with email & password
  Future signUpByEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      return user;
    } catch(e) {
      // print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      // print(e.toString());
      return null;
    }
  }
}