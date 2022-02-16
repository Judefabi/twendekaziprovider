import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twendekaziprovider/screens/home_screen.dart';
import 'package:twendekaziprovider/screens/login_screen.dart';

class StoreLocationMap extends StatefulWidget {
  const StoreLocationMap({Key? key}) : super(key: key);

  @override
  _StoreLocationMapState createState() => _StoreLocationMapState();
}

class _StoreLocationMapState extends State<StoreLocationMap> {
  bool buttonToggle = true;

  late Position position;
  late Widget _child;
  LatLng latlng = LatLng(32.5259483, 35.8506622);
  // late LatLng latlng;
  late GoogleMapController mapController;
  // List<Marker> allMarkers = [];
  final List<Marker> _markers = [];
  @override
  void initState() {
    _child = const Center(
      child: CircularProgressIndicator(),
    );
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.location_on_outlined),
                onPressed: () {},
              );
            },
          ),
          title: const Text('Select Location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          elevation: 0.0,
          foregroundColor: Colors.black,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(child: _child),
            Positioned(
              bottom: 30,
              child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      onPressed: () async {
                        // Position position = await Geolocator.getCurrentPosition(
                        //     desiredAccuracy: LocationAccuracy.bestForNavigation);
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final User? user = auth.currentUser;
                        final uid = user!.uid;
                        FirebaseFirestore.instance
                            .collection('providers')
                            .doc(uid)
                            .set({
                              'coords': new GeoPoint(
                                  latlng.latitude, latlng.longitude)
                            }, SetOptions(merge: true))
                            .then((value) => Fluttertoast.showToast(
                                msg: 'Location saved successfully'))
                            .catchError((error) => Fluttertoast.showToast(
                                msg: "Failed to add location: $error"));
                        Get.to(const HomeScreen());
                      },
                      // updateLocation;
                      // Get.to(const LoginScreen());
                      child: const Text(
                        "SELECT LOCATION",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.location_searching_sharp,
                  size: 50,
                  color: Colors.black,
                ))
            // Image.asset(
            //   'assets/greenpushpin.png',
            //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            //     return Transform.translate(
            //       offset: const Offset(0, 0),
            //       child: child,
            //     );
            //   },
            // )
          ],
        ));
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      // markers: allMarkers(),
      onMapCreated: (mapController) {
        final marker = Marker(
          markerId: const MarkerId('0'),
          position: LatLng(position.latitude, position.longitude),
        );

        _markers.add(marker);
      },
      onCameraMove: (object) {
        setState(() {
          _markers.first =
              _markers.first.copyWith(positionParam: object.target);
          latlng = object.target;
          buttonToggle = false;
        });
        // Fluttertoast.showToast(
        //     msg:
        //         // 'Position: ${object.target.latitude}, ${object.target.longitude}'
        //         );
      },
      initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 17.0),
      // myLocationButtonEnabled: true,
      // onCameraIdle: () async {
      //   // notify map stopped moving
      //   // mapPickerController.mapFinishedMoving!();
      //   //get address name from camera position
      //   List<Placemark> placemarks = await placemarkFromCoordinates(
      //     object.target.latitude,
      //     cameraPosition.target.longitude,
      //   );
      // }
    );
  }

  // void onMapCreated(controller) {
  //   setState(() {
  //     mapController = controller;
  //   });
  // }

}


// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class StoreLocationMap extends StatefulWidget {
//   const StoreLocationMap({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _StoreLocationMapState createState() => _StoreLocationMapState();
// }

// class _StoreLocationMapState extends State<StoreLocationMap> {
//   final List<Marker> _markers = [];
//   late Position position;
//   late GoogleMapController mapController;
//    late Widget _child;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         GoogleMap(
//           initialCameraPosition: CameraPosition(
//               target: LatLng(position.latitude, position.longitude), zoom: 14),
//           markers: _markers.toSet(),
//           onMapCreated: (controller) {
//             final marker = Marker(
//               markerId: MarkerId('0'),
//               position: LatLng(position.latitude, position.longitude),
//             );

//             _markers.add(marker);
//           },
//           onCameraMove: (position) {
//             setState(() {
//               _markers.first =
//                   _markers.first.copyWith(positionParam: position.target);
//             });
//           },
//         ),
//         // Image.asset(
//         //   'assets/images/delivery-area-start-pin.png',
//         //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         //     return Transform.translate(
//         //       offset: const Offset(8, -37),
//         //       child: child,
//         //     );
//         //   },
//         // )
//       ],
//     );
//   }
// }