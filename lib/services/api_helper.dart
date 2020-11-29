import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  final url =
      'https://api.opentripmap.com/0.1/en/places/radius?radius=1000&lon=106.793918&lat=-6.590889&kinds=tourist_object&apikey=5ae2e3f221c38a28845f05b6c72387e1259721452cca336f7535adb0';

  Future getPlacesList() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
