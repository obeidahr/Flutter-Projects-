import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myMarkers = HashSet<Marker>(); //collection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792), zoom: 14),
          onMapCreated: (GoogleMapController googleMapController) {
            setState(() {
              myMarkers.add(
                Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(37.43296265331129, -122.08832357078792),
                    infoWindow: InfoWindow(
                      title: 'ob',
                      snippet: 'city',
                      onTap: (){
                        print('marker tap');
                      }
                    ),
                    ),
              );
            });
          },
          markers: myMarkers,
        ),
        Container(
          child: Text('there here'),
          alignment: Alignment.bottomCenter,
        ),
      ]),
    );
  }
}
