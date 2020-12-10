import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static String defaultPhoto =
      'https://firebasestorage.googleapis.com/v0/b/ngabolang.appspot.com/o/user%2FdefaultProfile%2FphotoDefault.png?alt=media&token=4aa176b4-be69-41c8-8ba0-55b3292ac0b4';

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static Future<String> signUpWithEmailandPassword(
      String email, String password, String name) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser.updateProfile(displayName: name);
      String uid = _firebaseAuth.currentUser.uid;
      await _firebaseFirestore.collection('users').doc(uid).update(
        {'displayName': name},
      );
      return 'success';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> addProfilePhoto(String photoUrl) async {
    String uid = _firebaseAuth.currentUser.uid;
    try {
      if (photoUrl == null || photoUrl == "") {
        await _firebaseAuth.currentUser.updateProfile(photoURL: defaultPhoto);
        await _firebaseFirestore.collection('users').doc(uid).update(
          {'photoURL': defaultPhoto},
        );
        return 'success';
      } else {
        await _firebaseAuth.currentUser.updateProfile(photoURL: photoUrl);

        await _firebaseFirestore.collection('users').doc(uid).update(
          {'photoURL': photoUrl},
        );
        return 'success';
      }
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> loginWithEmailandPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'success';
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
      return 'success';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> editUserProfile(String name, String photoUrl) async {
    String uid = _firebaseAuth.currentUser.uid;
    try {
      if (photoUrl == null || photoUrl == "") {
        await _firebaseAuth.currentUser
            .updateProfile(displayName: name, photoURL: defaultPhoto);
        await _firebaseFirestore.collection('users').doc(uid).update(
          {
            'displayName': name,
            'photoURL': defaultPhoto,
          },
        );
        return 'success';
      } else {
        await _firebaseAuth.currentUser
            .updateProfile(displayName: name, photoURL: photoUrl);
        await _firebaseFirestore.collection('users').doc(uid).update(
          {
            'displayName': name,
            'photoURL': photoUrl,
          },
        );
        return 'success';
      }
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
