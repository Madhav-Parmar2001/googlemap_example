import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google_Map extends StatefulWidget {
  @override
  State<Google_Map> createState() => _Google_MapState();
}

class _Google_MapState extends State<Google_Map> {

  static const _initialCameraPosition = CameraPosition(
    bearing: 0.8334901395799,
    tilt: 45.440717697143555,
    target: LatLng(21.1702, 72.8311),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GoogleMap"),
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
                        mapType: MapType.normal,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        initialCameraPosition: _initialCameraPosition,
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
