import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final List<Marker> markers = [
    const Marker(
      markerId: MarkerId("marker1"),
      position: LatLng(-8.066389, 114.245278),
      infoWindow: InfoWindow(title: "Marker 1"),
    ),
    const Marker(
      markerId: MarkerId("marker2"),
      position: LatLng(0.939167, 130.515),
      infoWindow: InfoWindow(title: "Marker 2"),
    ),
    const Marker(
      markerId: MarkerId("marker3"),
      position: LatLng(-8.049167, 112.920556),
      infoWindow: InfoWindow(title: "Marker 3"),
    ),
    const Marker(
      markerId: MarkerId("marker4"),
      position: LatLng(-7.751944, 110.491389),
      infoWindow: InfoWindow(title: "Marker 4"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Pemetaan Lokasi Wisata'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(-8.186944, 113.700556), // Posisi awal peta
          zoom: 5.0,
        ),
        markers: Set<Marker>.from(markers),
      ),
    );
  }
}
