import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMap_DraglableScroll extends StatefulWidget {
  @override
  State<GoogleMap_DraglableScroll> createState() => _GoogleMap_DraglableScrollState();
}

class _GoogleMap_DraglableScrollState extends State<GoogleMap_DraglableScroll> {

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
          onTap: (){showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context){
                return Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children:const [
                      Text("Bottom Sheet"),
                      ElevatedButton(
                        child: Text("Close Sheet"),
                      ),
                    ],
                  ),
                );
              }
          );
          },
          markerId: const MarkerId("id-1"),
          position: const LatLng(21.1702, 72.8311),
          infoWindow: const InfoWindow(
            title: "Surat",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoogleMap Dragable Scroll"),
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
                        mapType: MapType.satellite,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        initialCameraPosition: _initialCameraPosition,
                        onMapCreated: _onMapCreated,
                        markers: _marker,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              bottom: 0,
              right: 0,
              left: 0,
              child: DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.60,
                expand: true,
                builder: (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: CustomScrollViewContent(),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      clipBehavior: Clip.none,
      borderOnForeground: true,
      semanticContainer: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        const Text("Madhav"),
        const SizedBox(height: 12),
        CustomDraggingHandle(),
        const SizedBox(height: 16),
        CustomExploreBerlin(),
        const SizedBox(height: 24),
        CustomFeaturedListsText(),
        const SizedBox(height: 16),
        CustomFeaturedItemsGrid(),
        const SizedBox(height: 16),
      ],
    );
  }
}


class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomExploreBerlin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Explore Berlin", style: TextStyle(fontSize: 22, color: Colors.black45)),
        const SizedBox(width: 8),
        Container(
          height: 24,
          width: 24,
          child: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}


class CustomFeaturedListsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      //only to left align the text
      child: Row(
        children: const <Widget>[Text("Featured Lists", style: TextStyle(fontSize: 14))],
      ),
    );
  }
}

class CustomFeaturedItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        //to avoid scrolling conflict with the dragging sheet
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
        ],
      ),
    );
  }
}






class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

