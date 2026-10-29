import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _greenLifeLocation = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bank Sampah Hijau')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _greenLifeLocation,
          zoom: 15,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('greenlife_bandung'),
            position: _greenLifeLocation,
            infoWindow: InfoWindow(
              title: 'Bank Sampah Hijau',
              snippet: 'Komunitas Bank Sampah Hijau',
            ),
          ),
        },
      ),
    );
  }
}