import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_application_1/loginscreen.dart';
//import 'package:flutter_application_1/reportar.dart';

class MapadeReportes extends StatefulWidget {
  const MapadeReportes({super.key});

  @override
  MapadeReportesScreenState createState() => MapadeReportesScreenState();
}

class MapadeReportesScreenState extends State<MapadeReportes> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(32.62311109650443, -115.45107453997345), zoom: 11.5);

  late GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.blue,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
