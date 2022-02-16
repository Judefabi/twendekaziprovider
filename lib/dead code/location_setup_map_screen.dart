// import 'dart:core';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:twendekaziprovider/screens/home_screen.dart';
// import 'package:twendekaziprovider/screens/login_screen.dart';

// class LocationSelection extends StatefulWidget {
//   const LocationSelection({Key? key}) : super(key: key);

//   @override
//   _LocationSelectionState createState() => _LocationSelectionState();
// }

// class _LocationSelectionState extends State<LocationSelection> {
//   // bool mapToggle = false;

//   late Position position;
//   late Widget _child;
//   LatLng latlng = LatLng(0.0, 0.0);
//   // late LatLng latlng;
//   late GoogleMapController mapController;
//   // List<Marker> allMarkers = [];
//   final List<Marker> _markers = [];

//   @override
//   void initState() {
//     _child = const Center(
//       child: CircularProgressIndicator(),
//     );
//     getCurrentLocation();
//     super.initState();
//   }

//   void getCurrentLocation() async {
//     Position res = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.bestForNavigation);
//     setState(() {
//       position = res;
//       _child = mapWidget();
//     });

//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       // return Future.error('Location services are disabled.');
//       Fluttertoast.showToast(msg: 'Location services are disabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // return Future.error('Location permissions are denied');
//         Fluttertoast.showToast(msg: 'Location permissions are disabled');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       Fluttertoast.showToast(msg: 'Permissions are denied forever');
//     }

//     // await getAddress(position.latitude, position.longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: const Icon(Icons.location_on_outlined),
//                 onPressed: () {},
//               );
//             },
//           ),
//           title: const Text('Select Location',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//           centerTitle: true,
//           elevation: 0.0,
//           foregroundColor: Colors.black,
//         ),
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(child: _child),
//             Positioned(
//                 bottom: 30,
//                 child: Material(
//                   elevation: 5,
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.black,
//                   child: MaterialButton(
//                       padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//                       minWidth: MediaQuery.of(context).size.width * 0.7,
//                       onPressed: () async {
//                         // Position position = await Geolocator.getCurrentPosition(
//                         //     desiredAccuracy:
//                         //         LocationAccuracy.bestForNavigation);
//                         final FirebaseAuth auth = FirebaseAuth.instance;
//                         final User? user = auth.currentUser;
//                         final uid = user!.uid;
//                         FirebaseFirestore.instance
//                             .collection('providers')
//                             .doc(uid)
//                             .set({
//                               'coords': new GeoPoint(
//                                   position.latitude, position.longitude)
//                             }, SetOptions(merge: true))
//                             .then((value) => Fluttertoast.showToast(
//                                 msg: 'Location saved successfully'))
//                             .catchError((error) => Fluttertoast.showToast(
//                                 msg: "Failed to add location: $error"));
//                       },
//                       // updateLocation;
//                       // Get.to(const LoginScreen());
//                       child: const Text(
//                         "SELECT LOCATION",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                 )),
//             const Align(
//                 alignment: Alignment.center,
//                 child: Icon(
//                   Icons.push_pin_rounded,
//                   size: 50,
//                   color: Colors.black,
//                 ))
//           ],
//         ));
//   }

//   Widget mapWidget() {
//     return GoogleMap(
//       mapType: MapType.normal,
//       // markers: _markers, //we want to have the marker class but not display the marker on the map
//       onMapCreated: (mapController) {
//         final marker = Marker(
//           markerId: const MarkerId('locmarker'),
//           position: LatLng(position.latitude, position.longitude),
//         );

//         _markers.add(marker);
//       },
//       onCameraMove: (object) {
//         setState(() {
//           _markers.first =
//               _markers.first.copyWith(positionParam: object.target);
//           latlng = object.target;
//         });
//       },
//       initialCameraPosition: CameraPosition(
//           target: LatLng(position.latitude, position.longitude), zoom: 17.0),
//       myLocationButtonEnabled: true,
//     );
//   }
// }
