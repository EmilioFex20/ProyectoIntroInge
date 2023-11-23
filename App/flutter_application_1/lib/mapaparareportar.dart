import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_application_1/loginscreen.dart';
//import 'package:flutter_application_1/reportar.dart';

class MapaParaReportar extends StatefulWidget {
  const MapaParaReportar({super.key});

  @override
  MapaParaReportarScreenState createState() => MapaParaReportarScreenState();
}

class MapaParaReportarScreenState extends State<MapaParaReportar> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(32.62311109650443, -115.45107453997345), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              onLongPress: (latlang) {
                _addMarkerLongPressed(
                    latlang); //we will call this function when pressed on the map
              },
              markers: Set<Marker>.of(markers.values), //all markers are here
            ))
      ]),
    );
  }

  Future _addMarkerLongPressed(LatLng latlang) async {
    setState(() {
      const MarkerId markerId = MarkerId("origen");
      Marker marker = Marker(
        markerId: markerId,
        draggable: true,
        position:
            latlang, //With this parameter you automatically obtain latitude and longitude
        infoWindow: const InfoWindow(
          title: "Marker here",
          snippet: 'This looks good',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers[markerId] = marker;
    });

    //This is optional, it will zoom when the marker has been created
    //GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newLatLngZoom(latlang, 17.0));
  }
}
