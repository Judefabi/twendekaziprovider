import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/controllers/order_controller.dart';
import 'package:twendekaziprovider/model/bids_model.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  // final orderController orderController = Get.put(orderController());
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
                onPressed: () {
                  Get.back();
                },
              );
            },
          ),
          title: const Text('Order Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          elevation: 0.0,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.drag_indicator_sharp))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            onPressed: () async {
                              final FirebaseAuth auth = FirebaseAuth.instance;
                              final User? user = auth.currentUser;

                              // _saveOrder();
                              final bid = Bid(
                                ordername: order.ordername,
                                orderid: order.orderid,
                                orderdescription: order.orderdescription,
                                orderdetails: order.orderdetails,
                                ordercreatedAt: order.ordercreatedAt,
                                ordercategory: order.ordercategory,
                                orderdate: order.orderdate,
                                orderownerid: order.orderownerid,
                                orderprice: order.orderprice,
                                providerid: user!.uid,
                                isAssigned: false,
                              );

                              placeBid(bid);
                            },
                            // updateLocation;
                            // Get.to(const LoginScreen());
                            child: const Text(
                              "PLACE BID",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Icon(Icons.bookmark_add_outlined,
                          size: 40, color: Colors.black)
                    ]))),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                child: Column(children: [
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.ordername,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            // IconButton(
                            //   icon: const Icon(Icons.bookmark_add_outlined,
                            //       color: Colors.black),
                            //     onPressed: () {},
                            // ),
                          ],
                        ),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
                        // const SizedBox(height: 25),
                        Text(
                          order.orderdescription,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
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
                              Text('Kshs. ${order.orderprice}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]),
                        // const SizedBox(height: 15),
                        Divider(
                            height: 50,
                            color: Colors.grey[600],
                            thickness: 0.5),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Divider(
                                height: 50,
                                color: Colors.grey[600],
                                thickness: 0.5),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Category',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            const SizedBox(height: 5),
                            Text(order.ordercategory,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Divider(
                          height: 50,
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        Text('Detailed Description',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(order.orderdetails,
                            style: const TextStyle(
                              fontSize: 14,
                            ))
                      ])),
                ]))
          ]),
        ));
  }

  Future placeBid(Bid bid) async {
    final placebid = FirebaseFirestore.instance
        .collection('orders')
        .doc(order.orderid)
        .collection('bids')
        .doc();

    final json = bid.toJson();
    await placebid.set(json).then((value) => {
          Fluttertoast.showToast(msg: "Bid placed Successfully"),
          Get.to(OrdersScreen()),
        });
  }
}
