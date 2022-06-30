import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap_example/googlemap/Google_Permission.dart';


class NewCordinateLocation extends StatefulWidget{
  @override
  _NewCordinateLocationState createState() => _NewCordinateLocationState();
}

class _NewCordinateLocationState extends State<NewCordinateLocation> {
  String googleApikey = "AIzaSyAlP5KeHc0fUpJNg-ziQKiuoALxsvmxaJM";
  GoogleMapController mapController; //contrller for Google map
  LatLng startLocation = LatLng(21.2159, 72.7915);
  Set<Marker> _marker = {};

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Move to New Position of Map"),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          child: Text("Move"),
          onPressed: (){
            LatLng newlatlang = LatLng(23.0128, 72.7219);
            mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 17, tilt: 45.440717697143555, bearing: 0.8334901395799,)
                  //17 is new zoom level
                )
            );
            //move position of map camera to new location
          },
        ),

        body: Container(
          child:GoogleMap(
            initialCameraPosition: CameraPosition( //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            markers: _marker,
            zoomGesturesEnabled: true,
            mapType: MapType.hybrid,
            onMapCreated: (controller) { //method called when map is created
              setState(() {
                mapController = controller;
                _marker.add(
                  Marker(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Google_Permission()));
                    },
                    markerId: MarkerId("id-1"),
                    position: LatLng(21.2159, 72.7915),
                    infoWindow: InfoWindow(
                      title: "Surat",
                    ),
                  ),
                );
              });
            },
          ),
        )
    );
  }
}