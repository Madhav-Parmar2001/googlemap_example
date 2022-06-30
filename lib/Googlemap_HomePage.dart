import 'package:flutter/material.dart';
import 'package:googlemap_example/Payment/payment.dart';
import 'package:googlemap_example/googlemap/GoogleMapCustomMarker.dart';
import 'package:googlemap_example/googlemap/GoogleMapMarker.dart';
import 'package:googlemap_example/googlemap/GoogleMap_DraglableScroll.dart';
import 'package:googlemap_example/googlemap/Google_Map.dart';
import 'package:googlemap_example/googlemap/Google_Permission.dart';
import 'package:googlemap_example/googlemap/InternetConnection.dart';
import 'package:googlemap_example/googlemap/NewCordinateLocation.dart';

class GoogleMap_HomePage extends StatefulWidget {
  const GoogleMap_HomePage({Key key}) : super(key: key);

  @override
  State<GoogleMap_HomePage> createState() => _GoogleMap_HomePageState();
}

class _GoogleMap_HomePageState extends State<GoogleMap_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoogleMap Home"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text("1"),
            title: Text("Payment System"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => payment()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("2"),
            title: Text("Google Map"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Google_Map()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("3"),
            title: Text("Google Map Default Marker"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapMarker()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("4"),
            title: Text("Google Map Custom Marker"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapCustomMarker()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("5"),
            title: Text("Google Map Location"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Google_Permission()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("6"),
            title: Text("Google Map Dragable & Bottom Sheet"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMap_DraglableScroll()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("7"),
            title: Text("Internet Connection"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InternetConnection()));
            },
          ),
          Divider(),

          ListTile(
            leading: Text("8"),
            title: Text("Google Map New Cordinate Location"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewCordinateLocation()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
