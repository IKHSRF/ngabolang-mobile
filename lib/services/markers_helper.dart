import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersHelper {
  static Set<Marker> populateMarkers(dynamic data) {
    Set<Marker> _markers = Set();

    for (var place in data['features']) {
      String id = place['id'];
      List<dynamic> position = place['geometry']['coordinates'];
      double long = position[0];
      double lat = position[1];
      String name = place['properties']['name'];

      Marker marker = Marker(
        markerId: MarkerId(id),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: name),
      );

      _markers.add(marker);
    }

    return _markers;
  }
}
