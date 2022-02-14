// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:twendekazi/Profile/provider_profile.dart';
// import 'package:twendekazi/firebasedata/carousellistitems.dart';
// import 'package:twendekazi/selectprovider/orderprovider.dart';
// //import 'package:geocoding/geocoding.dart';
// //constants

// class GoogleMapScreen extends StatefulWidget {
//   @override
//   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   // List<Marker> allMarkers = [];
//   // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   // final Stream<QuerySnapshot> _providersStream =
//   //     FirebaseFirestore.instance.collection('Providers').snapshots();
//   Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _initialCamPosition = CameraPosition(
//     target: LatLng(0.5169694682667356, 35.275318903656135),
//     zoom: 15.0,
//   );

//   // static final CameraPosition _locateProvider = CameraPosition(
//   //     // bearing: 192.8334901395799,
//   //     target: LatLng(10.5169694682667356, 35.395318903656135),
//   //     zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('Providers').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }
//           if (snapshot.hasData) {
//             snapshot.data!.docs.forEach((element) {
//               var mar = element.id;
//               final MarkerId markerId = MarkerId(mar);

//               _markers[markerId] = Marker(
//                 markerId: markerId,
//                 position: LatLng(
//                   element['coords'].latitude,
//                   element['coords'].longitude,
//                 ),

//                 // infoWindow: InfoWindow(
//                 //   title: element['name'],
//                 // )
//                 // onTap: {}()
//               );
//             });

//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Service Providers',
//                     style: TextStyle(
//                         fontFamily: 'varela',
//                         fontSize: 24,
//                         fontWeight: FontWeight.w300,
//                         color: Color(0xFF473D3A))),
//                 centerTitle: true,
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.greenAccent[700]),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//               ),
//               body: Container(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       height: MediaQuery.of(context).size.height - 50.0,
//                       width: MediaQuery.of(context).size.width,
//                       child: GoogleMap(
//                         onMapCreated: (GoogleMapController controller) {
//                           // setState(() {
//                           //   //mapController= controller;
//                           // });
//                           _controller.complete(controller);
//                         },
//                         initialCameraPosition: _initialCamPosition,
//                         // CameraPosition(
//                         //     target:
//                         //         LatLng(0.5169694682667356, 35.275318903656135),
//                         //     zoom: 15.0),
//                         mapType: MapType.normal,
//                         markers: Set<Marker>.of(_markers.values),
//                       ),
//                     ),
//                     //ridermark ()
//                     Positioned(
//                         bottom: 30.0,
//                         child: Container(
//                             height: 150,
//                             width: MediaQuery.of(context).size.width,
//                             child: StreamBuilder<QuerySnapshot>(
//                               stream: FirebaseFirestore.instance
//                                   .collection('Providers')
//                                   .snapshots(),
//                               builder: (BuildContext context,
//                                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                                 if (snapshot.hasError) {
//                                   return Text('Something went wrong');
//                                 }

//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return CircularProgressIndicator();
//                                 }

//                                 return ListView(
//                                   scrollDirection: Axis.horizontal,
//                                   children: snapshot.data!.docs
//                                       .map((DocumentSnapshot document) {
//                                     Map<String, dynamic> data = document.data()!
//                                         as Map<String, dynamic>;
//                                     return Container(
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 5),
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(boxShadow: [
//                                           BoxShadow(
//                                               color: Colors.grey[200]!,
//                                               blurRadius: 3,
//                                               offset: Offset(0, 1)),
//                                         ], color: Colors.white),
//                                         child: ListTile(
//                                             onTap: () async {
//                                               final GoogleMapController
//                                                   controller =
//                                                   await _controller.future;
//                                               controller.animateCamera(
//                                                   CameraUpdate.newCameraPosition(
//                                                       CameraPosition(
//                                                           // bearing: 192.8334901395799,
//                                                           target: LatLng(
//                                                               data['coords']
//                                                                   .latitude,
//                                                               data['coords']
//                                                                   .longitude),
//                                                           zoom: 15)));
//                                             },
//                                             leading: Container(
//                                                 padding: EdgeInsets.all(2.3),
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     shape: BoxShape.circle),
//                                                 child: CircleAvatar(
//                                                     maxRadius: 30.0,
//                                                     backgroundImage:
//                                                         NetworkImage(
//                                                       "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
//                                                     ))),
//                                             title: Text(data['name']),
//                                             subtitle: Text(data['price']),
//                                             trailing: IconButton(
//                                                 onPressed: () {},
//                                                 icon: Icon(Icons.add_task))));
//                                   }).toList(),
//                                 );
//                               },
//                             )))
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Text("returning..");
//         });
//   }

//   // Future<void> _animateCam() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_locateProvider));
//   // }
// }

// Future<void> _animateCam(latitude, longitude) async {
//   Completer<GoogleMapController> _controller = Completer();
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       // bearing: 192.8334901395799,
//       target: LatLng(10.5169694682667356, 35.395318903656135),
//       zoom: 19.151926040649414)));
// }

// /*
// Container(
//                                       height: 200,
//                                       width: 350,
//                                       // color: Colors.grey,
//                                       child: Card(
//                                         child: InkWell(
//                                           onTap: () async {
//                                             final GoogleMapController
//                                                 controller =
//                                                 await _controller.future;
//                                             controller.animateCamera(
//                                                 CameraUpdate.newCameraPosition(
//                                                     CameraPosition(
//                                                         // bearing: 192.8334901395799,
//                                                         target: LatLng(
//                                                             data['coords']
//                                                                 .latitude,
//                                                             data['coords']
//                                                                 .longitude),
//                                                         zoom: 15)));
//                                           },
//                                           child: ListTile(
//                                               minVerticalPadding: 30,
//                                               leading: CircleAvatar(
//                                                   backgroundImage: NetworkImage(
//                                                 'https://images.unsplash.com/photo-1604565034244-321b7308f0c3?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDg3fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
//                                               )),
//                                               title: Text(data['name']),
//                                               subtitle: Text(data[
//                                                   'price']), //to be changed to rating or phone number
//                                               trailing: TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 ProviderProfile()));
//                                                   },
//                                                   child: Text(
//                                                     'REQUEST',
//                                                   ),
//                                                   style: TextButton.styleFrom(
//                                                       padding:
//                                                           EdgeInsets.symmetric(
//                                                               horizontal: 5,
//                                                               vertical: 5),
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                               side: BorderSide(
//                                                                   color: Colors
//                                                                       .blue))))),
//                                         ),
//                                       ),
//                                     );
//  */
// /*Container(
//                   child: Column(children: [
//                 Row(children: [
//                   Text(
//                     'Top Providers',
//                     style: TextStyle(
//                         fontFamily: 'varela',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 27,
//                         color: Color(0xFF473D3A)),
//                   ),
//                   TextButton(onPressed: () {}, child: Text('See all'))
//                 ]),
//                 ListTile(
//                     leading: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                       'https://images.unsplash.com/photo-1604565034244-321b7308f0c3?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDg3fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
//                     )),
//                     title: Text('Jude Fabiano'),
//                     subtitle: Text(
//                         '+254797544152'), //to be changed to rating or phone number
//                     trailing: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'REQUEST',
//                         ),
//                         style: TextButton.styleFrom(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 5, vertical: 5),
//                             shape: RoundedRectangleBorder(
//                                 side: BorderSide(color: Colors.blue)))))
//                 // _topProviderCard(),
//                 // _topProviderCard(),
//                 // _topProviderCard(),
//                 // _topProviderCard(),
//               ])) */

// /*TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'REQUEST',
//                       ),
//                       style: TextButton.styleFrom(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                           shape: RoundedRectangleBorder(
//                               side: BorderSide(color: Colors.blue)))) */