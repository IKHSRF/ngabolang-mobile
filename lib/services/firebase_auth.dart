import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
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

  static Future<String> addProfilePhoto(String photoUrl) async {
    try {
      if (photoUrl == null || photoUrl == "") {
        String defaultPhoto = 'https://firebasestorage.googleapis.com/v0/b/ngabolang.appspot.com/o/user%2FdefaultProfile%2FphotoDefault.png?alt=media&token=4aa176b4-be69-41c8-8ba0-55b3292ac0b4';
        await _firebaseAuth.currentUser.updateProfile(photoURL: defaultPhoto);
        return 'berhasil';
      } else {
        await _firebaseAuth.currentUser.updateProfile(photoURL: photoUrl);
        return 'berhasil';
      }
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

  static Future<String> signInwitgGoogle() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
