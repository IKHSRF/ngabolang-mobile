import 'package:http/http.dart' as http;

class PostCompress {
  static Future<String> compressInApi(String postId) async {
    String apiUrl = '/api/compress/';

    await http.post(apiUrl, headers: {
      "postId": postId,
    });
    return 'ini belum bisa';
  }
}
