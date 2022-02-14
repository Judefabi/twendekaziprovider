import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/controllers/product_controller.dart';
import 'package:twendekaziprovider/model/product_model.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziprovider/model/product_model.dart';

// class OrdersScreenCheck extends StatefulWidget {
//   const OrdersScreenCheck({Key? key}) : super(key: key);

//   @override
//   _OrdersScreenCheckState createState() => _OrdersScreenCheckState();
// }

// class _OrdersScreenCheckState extends State<OrdersScreenCheck> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('products').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['productdescription']),
//               subtitle: Text(data['productname']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }

class OrdersScreenCheck extends StatelessWidget {
  OrdersScreenCheck({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            );
          },
        ),
        title: const Text('Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.playlist_play_rounded),
          )
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}');
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView(children: products.map(buildProduct).toList());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // Stream<List<Product>> getProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  // Stream<List<Product>> getProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }
  Widget buildProduct(Product product) {
    // return ListTile(
    //   leading: Text(product.productname),
    // );
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
      child: InkWell(
        onTap: () {},
        child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.productname,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_add_outlined,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Rate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              )),
                          const SizedBox(height: 5),
                          Text('Kshs. ${product.productprice}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Approx. Duration',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            SizedBox(height: 5),
                            Text('3 Hrs',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('Complexity',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            SizedBox(height: 5),
                            Text('Very Complex',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Experience Level',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            )),
                        SizedBox(height: 5),
                        Text('Intermediate',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(product.productdescription,
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    const SizedBox(height: 25)
                  ])),
            )),
      ),
    );
  }
}

// class productCard extends StatelessWidget {
//   productCard({Key? key, required this.product}) : super(key: key);

//   final product product;
//   final productController productController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     // var products = Product.products
//     //     .where((product) => product.productIds.contains(product.id))
//     //     .toList();
//     return Padding(
//       padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
//       child: Card(
//           margin: EdgeInsets.zero,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("product ID: ${product.id}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       )),
//                   Text(DateFormat('dd-MM-yy').format(product.createdAt),
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       )),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               // ListView.builder(
//               //     shrinkWrap: true,
//               //     physics: const NeverScrollableScrollPhysics(),
//               //     itemCount: products.length,
//               //     itemBuilder: (BuildContext context, int index) {
//               //       return Padding(
//               //         padding: const EdgeInsets.only(bottom: 10),
//               //         child: Row(
//               //           children: [
//               //             Column(
//               //                 crossAxisAlignment: CrossAxisAlignment.start,
//               //                 children: [
//               //                   Text(products[index].name,
//               //                       style: const TextStyle(
//               //                         fontSize: 14,
//               //                         fontWeight: FontWeight.bold,
//               //                       )),
//               //                   const SizedBox(height: 5),
//               //                   SizedBox(
//               //                     width: 285,
//               //                     child: Text(
//               //                       products[index].description,
//               //                       style: const TextStyle(
//               //                         fontSize: 12,
//               //                       ),
//               //                       overflow: TextOverflow.clip,
//               //                       maxLines: 2,
//               //                     ),
//               //                   ),
//               //                 ])
//               //           ],
//               //         ),
//               //       );
//               //     }),
//               const SizedBox(height: 10),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//                 Column(
//                   children: [
//                     const Text("Delivery Fee",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         )),
//                     const SizedBox(height: 10),
//                     Text("$product.deliveryFee",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Text("Total",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         )),
//                     const SizedBox(height: 10),
//                     Text("$product.total",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ],
//                 )
//               ]),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   product.isAccepted
//                       ? ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.black,
//                               minimumSize: const Size(150, 40)),
//                           onPressed: () {
//                             // productController.updateproduct(
//                             //     product, 'isDelivered', !product.isAccepted);
//                           },
//                           child: const Text(
//                             "Deliver",
//                             style: TextStyle(fontSize: 12),
//                           ))
//                       : ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.black,
//                               minimumSize: const Size(150, 40)),
//                           onPressed: () {
//                             // productController.updateproduct(
//                             //     product, 'isAccepted', !product.isAccepted);
//                           },
//                           child: const Text(
//                             "Accept",
//                             style: TextStyle(fontSize: 12),
//                           )),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.black,
//                           minimumSize: const Size(150, 40)),
//                       onPressed: () {
//                         // productController.updateproduct(
//                         //     product, 'isCancelled', !product.isCancelled);
//                       },
//                       child: const Text(
//                         "Cancel",
//                         style: TextStyle(fontSize: 12),
//                       ))
//                 ],
//               )
//             ]),
//           )),
//     );
//   }
// }
