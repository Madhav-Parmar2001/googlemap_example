import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleMapCustomMarker extends StatefulWidget {

  @override
  State<GoogleMapCustomMarker> createState() => _GoogleMapCustomMarkerState();
}

class _GoogleMapCustomMarkerState extends State<GoogleMapCustomMarker> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  static const _initialCameraPosition = CameraPosition(
    bearing: 0.8334901395799,
    tilt: 45.440717697143555,
    target: LatLng(21.1702, 72.8311),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(2,5)), "Assets/Image/mapmarker.png",);
  }

  void _onMapCreated(GoogleMapController controller) async{
    // Timer.periodic(new Duration(seconds: 10), (timer) async{
    //   await FirebaseFirestore.instance.collection("Locations").get().then((documents){
    //     setState(() {
    //       _markers.clear();
    //     });
    //     documents.docs.forEach((document) {
    //       setState(() {
    //         _markers.add(
    //           Marker(
    //             markerId: MarkerId(document.id.toString()),
    //             position: LatLng(double.parse(document["lattitude"].toString()),double.parse(document["lontitude"].toString())),
    //              icon: mapMarker,
    //             infoWindow: InfoWindow(
    //               title: document["placename"].toString(),
    //             ),
    //           ),
    //         );
    //       });
    //     });
    //   });
    // });

    // await FirebaseFirestore.instance.collection("Locations").snapshots().map((documents){
    //   documents.docs.forEach((document) {
    //     print("DOC ID : "  + document.id.toString());
    //     setState(() {
    //       _markers.add(
    //         Marker(
    //           markerId: MarkerId(document.id.toString()),
    //           position: LatLng(double.parse(document["lattitude"].toString()),double.parse(document["lontitude"].toString())),
    //           icon: mapMarker,
    //           infoWindow: InfoWindow(
    //             title: document["placename"].toString(),
    //           ),
    //         ),
    //       );
    //     });
    //   });
    // });

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(21.1702, 72.8311),
           icon: mapMarker,
          infoWindow: InfoWindow(
              title: "Surat",
              snippet: "Gujrat"
          ),
        ),
      );
      _markers.add(
        Marker(
           icon: mapMarker,
          markerId: MarkerId("id-2"),
          position: LatLng(21.7051, 72.9959),
          infoWindow: InfoWindow(
              title: "Bharuch",
              snippet: "Gujrat"
          ),
        ),
      );
      _markers.add(
        Marker(
          icon: mapMarker,
          markerId: MarkerId("id-3"),
          position: LatLng(20.9467,72.9520),
          infoWindow: InfoWindow(
              title: "Navsari",
              snippet: "Gujrat"
          ),
        ),
      );
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoogleMap Custom Marker"),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _onMapCreated,
        markers: _markers ,
      ),
    );
  }
}
