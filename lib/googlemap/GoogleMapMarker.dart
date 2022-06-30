import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapMarker extends StatefulWidget {
  @override
  State<GoogleMapMarker> createState() => _GoogleMapMarkerState();
}

class _GoogleMapMarkerState extends State<GoogleMapMarker> {

  static const _initialCameraPosition = CameraPosition(
    bearing: 0.8334901395799,
    tilt: 45.440717697143555,
    target: LatLng(21.1702, 72.8311),
    zoom: 14.4746,
  );

  Set<Marker> _marker = {};
  Void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(21.1702, 72.8311),
          infoWindow: InfoWindow(
            title: "Surat",
          ),
        ),
      );

      _marker.add(
        Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(21.7051, 72.9959),
          infoWindow: InfoWindow(
            title: "Bharuch",
          ),
        ),
      );

      _marker.add(
        Marker(
          markerId: MarkerId("id-3"),
          position: LatLng(20.9467,72.9520),
          infoWindow: InfoWindow(
            title: "Navsari",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoogleMap Default Marker"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: GoogleMap(
                          buildingsEnabled: false,
                          compassEnabled: true,
                          mapToolbarEnabled: true,
                          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                          rotateGesturesEnabled: true,
                          scrollGesturesEnabled: true,
                          zoomGesturesEnabled: true,
                          liteModeEnabled: false,
                          tiltGesturesEnabled: true,
                          myLocationEnabled: false,
                          indoorViewEnabled: false,
                          trafficEnabled: false,
                          mapType: MapType.hybrid,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          initialCameraPosition: _initialCameraPosition,
                          onMapCreated: _onMapCreated,
                          markers: _marker,
                          // markers: _marker,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
}
