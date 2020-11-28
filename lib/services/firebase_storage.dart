import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class StorageServices {
  static Future<File> getImage() async {
    final picker = ImagePicker();
    var imageFile;
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    return imageFile;
  }

  static Future<String> uploadPhoto(File imageFile, String userId) async {
    String fileName = basename(imageFile.path);

    Reference ref = FirebaseStorage.instance.ref('user').child(userId).child(fileName);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot taskSnapshot = await task;

    return await taskSnapshot.ref.getDownloadURL();
  }

  static Future<String> uploadPostImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference ref = FirebaseStorage.instance.ref('posts').child(fileName);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot taskSnapshot = await task;

    return await taskSnapshot.ref.getDownloadURL();
  }
}
