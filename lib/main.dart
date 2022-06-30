import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Googlemap_HomePage.dart';
import 'googlemap/Google_Map.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        // fontFamily: "Lora"
      ),
      // home: GoogleMapsClonePage(),
      home: GoogleMap_HomePage(),
    );
  }
}



