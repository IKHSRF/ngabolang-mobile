import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  static Future<String> signUpWithEmailandPassword(String email, String password, String name) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseAuth.currentUser.updateProfile(displayName: name);
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> loginWithEmailandPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
