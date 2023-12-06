import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //libreria para implementar google maps

class MapaParaReportar extends StatefulWidget {
  const MapaParaReportar({super.key});

  @override
  MapaParaReportarScreenState createState() => MapaParaReportarScreenState();
}

class MapaParaReportarScreenState extends State<MapaParaReportar> {
  static const _initialCameraPosition = CameraPosition(
      //Posición inicial es la ubicación de mexicali
      target: LatLng(32.62311109650443, -115.45107453997345),
      zoom: 11.5);

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
                _addMarkerLongPressed(latlang);
                /*print(
                    latlang);*/
                //llamaremos esta función cuando se presione en el mapa
                //para imprimir la latitud y longitud
                //NOTA: el print esta de ejemplo, no se debe de usar en código de producción
              },

              markers:
                  Set<Marker>.of(markers.values), //variable para marcadores
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
            latlang, //Con este parámetro obtienes automáticamente la latitud y longitud
        infoWindow: const InfoWindow(
          title: "Marker here",
          snippet: 'This looks good',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers[markerId] = marker;
    });
  }
}
