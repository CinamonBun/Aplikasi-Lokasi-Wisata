import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng markerLocation =
      LatLng(-8.157778, 113.723333); // Koordinat yang diberikan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta Flutter dengan Marker'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: markerLocation,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('MarkerID'),
            position: markerLocation,
            infoWindow: InfoWindow(title: 'Marker Title'),
          ),
        },
      ),
    );
  }
}
