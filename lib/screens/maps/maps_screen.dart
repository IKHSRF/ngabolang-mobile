import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'local_widget/maps_fab.dart';

class MapsScreen extends StatefulWidget {
  static final String id = 'maps_screen';

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  GoogleMapController _controller;
  Position position;
  StreamSubscription<Position> _locationSubscription;
  static final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  void getCurrentLocation() async {
    try {
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best)
              .listen((position) {
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17,
          )));
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          // Row(
          //   children: [
          //     MapsFab(
          //       onPressed: () => Get.back(),
          //       btnIcon: Icon(
          //         Icons.arrow_back_ios,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),
          GoogleMap(
            initialCameraPosition: _initialLocation,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
        ],
      ),
      floatingActionButton: MapsFab(
        onPressed: () => getCurrentLocation(),
        btnIcon: Icon(
          Icons.location_on_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
