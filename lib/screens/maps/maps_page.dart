import 'package:ngabolang/services/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'local_widget/maps_fab.dart';
import 'local_widget/top_row.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ngabolang/services/markers_helper.dart';

class MapsPage extends StatefulWidget {
  static final String id = 'maps_screen';

  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  ApiHelper apiHelper = ApiHelper();
  bool _showHUD = true;
  GoogleMapController _controller;
  Position position;
  Set<Marker> _markers;
  static final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  void getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      if (_controller != null) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 17,
        )));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  void getApiData() async {
    dynamic response = await apiHelper.getPlacesList();
    setState(() {
      _showHUD = !_showHUD;
      _markers = MarkersHelper.populateMarkers(response);
      getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showHUD,
        opacity: 0.6,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialLocation,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
            TopRow(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: MapsFab(
          onPressed: () => getCurrentLocation(),
          btnIcon: Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
