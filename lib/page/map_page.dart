import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  TextEditingController searchController = TextEditingController();
  final places =
      GoogleMapsPlaces(apiKey: 'AIzaSyBNwPuLDTjdMYGx5fgqK1-EAb97OwgjzL4');
  Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Pemetaan Lokasi Maps'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search for nearby places',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchPlaces();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(-8.186944, 113.700556), // Posisi awal peta
                zoom: 15.0,
              ),
              markers: markers,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _searchPlaces() async {
    final response = await places.searchNearbyWithRadius(
      Location(lat: -8.186944, lng: 113.700556), // Posisi awal peta
      10000, // Radius pencarian dalam meter
      type: 'museum|park|beach', // Jenis tempat yang ingin dicari
      keyword: searchController.text,
    );

    setState(() {
      markers = Set<Marker>.from(response.results.map((result) {
        return Marker(
          markerId: MarkerId(result.placeId),
          position: LatLng(
              result.geometry!.location.lat, result.geometry!.location.lng),
          infoWindow: InfoWindow(
            title: result.name,
            snippet: result.types.join(', '),
          ),
        );
      }));
    });
  }
}
