import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Future<String> addPost(Timestamp date, String location, String uid, String imageUrl) async {
    try {
      await _firebaseFirestore.collection('posts').doc().set({
        'date': date,
        'location': location,
        'uid': uid,
        'url': imageUrl,
      });
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> addFavorite(String postID, String uid) async {
    try {
      await _firebaseFirestore.collection('users').doc(uid).update({
        'favorites': FieldValue.arrayUnion([postID]),
      });
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> removeFavorite(String postID, String uid) async {
    try {
      await _firebaseFirestore.collection('users').doc(uid).update({
        'favorites': FieldValue.arrayRemove([postID]),
      });
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
