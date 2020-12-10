import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static String defaultThumbUrl =
      'https://firebasestorage.googleapis.com/v0/b/ngabolang.appspot.com/o/posts%2Floading-indicator-view.jpg?alt=media&token=a6bdb1c8-6988-4fb4-b3c0-1029e823169f';

  static Future<String> addPost(
      Timestamp date, String location, String uid, String imageUrl) async {
    try {
      var result = await _firebaseFirestore.collection('posts').add({
        'date': date,
        'location': location,
        'thumbUrl': defaultThumbUrl,
        'uid': uid,
        'url': imageUrl,
      });
      print(result.id);
      return 'success';
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
      return 'success';
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
      return 'success';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  static Future<String> removePost(String postID) async {
    try {
      await _firebaseFirestore.collection('posts').doc(postID).delete();
      return 'success';
    } catch (error) {
      print(error);
      return error.message;
    }
  }
}
