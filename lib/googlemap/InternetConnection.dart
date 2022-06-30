import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnection extends StatefulWidget{
  @override
  _InternetConnectionState createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {

  StreamSubscription connection;
  bool isoffline = false;
  var checkconnection = "";

  @override
  void initState() {
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if(result == ConnectivityResult.none){
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.ethernet){
        //connection is from wired connection
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.bluetooth){
        //connection is from bluetooth threatening
        setState(() {
          isoffline = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    connection.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Check Internet Connection"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
              children:[
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("Check Internet Connection"),
                  onPressed: () async {
                    var result = await Connectivity().checkConnectivity();
                    if(result == ConnectivityResult.mobile) {
                      setState((){
                        print("Internet Connection is from Mobile data");
                        checkconnection ="Internet connection is from Mobile data";
                      });
                    }else if(result == ConnectivityResult.wifi) {
                      setState((){
                        print("Internet Connection is from wifi");
                        checkconnection ="Internet connection is from wifi";
                      });
                    }else if(result == ConnectivityResult.ethernet){
                      setState((){
                        print("Internet Connection is from Wired Cable");
                        checkconnection ="Internet connection is from Wired Cable";
                      });
                    }else if(result == ConnectivityResult.bluetooth){
                      setState((){
                        print("Internet Connection is from Bluethooth Threatening");
                        checkconnection ="Internet Connection is from Bluethooth Threatening";
                      });
                    }else if(result == ConnectivityResult.none){
                      setState((){
                        print("No internet connection");
                        checkconnection ="No internet connection";
                      });
                    }
                  },
                ),

                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 250,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom:30,top: 30),
                  color: isoffline?Colors.red:Colors.lightGreen,
                  //red color on offline, green on online
                  padding:EdgeInsets.all(10),
                  child:    Text(checkconnection!=null?checkconnection:'',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white
                    ),),
                ),

                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 250,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom:30,top: 30),
                  color: isoffline?Colors.red:Colors.lightGreen,
                  //red color on offline, green on online
                  padding:EdgeInsets.all(10),
                  child: Text(isoffline?"Device is Offline":"Device is Online",
                    style: TextStyle(
                        fontSize: 20, color: Colors.white
                    ),),
                ),
              ]
          )
      ),
    );
  }
}

