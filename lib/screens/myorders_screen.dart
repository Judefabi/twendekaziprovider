import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziprovider/controllers/order_controller.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/screens/assigned_orders_details_screen.dart';
// import 'package:twendekaziprovider/screens/bids_screen.dart';
// import 'package:twendekaziprovider/screens/new_order.dart';
import 'package:twendekaziprovider/screens/order_details.dart';
import 'package:twendekaziprovider/services/database_service.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Get.to(const NewOrderScreen());
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.post_add_outlined, color: Colors.white)),
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                );
              },
            ),
            title: const Text('My Orders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
            elevation: 0.0,
            foregroundColor: Colors.black,
            actions: const [],
            bottom: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 65),
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[600],
                indicatorColor: Colors.black,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(text: 'Completed'),
                ])),
        body: TabBarView(children: [
          StreamBuilder<List<Order>>(
            stream: getMyOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong ${snapshot.error}');
              } else if (snapshot.hasData) {
                final orders = snapshot.data!;
                return ListView(children: orders.map(_buildOrderCard).toList());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          StreamBuilder<List<Order>>(
            stream: getCompletedOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong ${snapshot.error}');
              } else if (snapshot.hasData) {
                final orders = snapshot.data!;
                return ListView(children: orders.map(_buildOrderCard).toList());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ]),
      ),
    );
  }

  Stream<List<Order>> getMyOrders() {
    return _firebaseFirestore
        .collection('orders')
        .where('providerid', isEqualTo: user!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList());
  }

  Stream<List<Order>> getCompletedOrders() {
    return _firebaseFirestore
        .collection('completedorders')
        .where('providerid', isEqualTo: user!.uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList());
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID:  ${order.orderid}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                // Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey[700],
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.ordercategory,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    )),
                // const Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w300,
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Get.to(AssignedOrderDetailsScreen(order: order));
                    },
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5)),
                    child: const Text(
                      "Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                // : OutlinedButton(
                //     onPressed: () {
                //       // Get.to(BidsScreen(order: order));
                //     },
                //     style: OutlinedButton.styleFrom(
                //         primary: Colors.black,
                //         side: const BorderSide(color: Colors.black),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(14)),
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 25, vertical: 5)),
                //     child: const Text(
                //       "View Bids",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontSize: 16,
                //           color: Colors.black,
                //           fontWeight: FontWeight.w600),
                //     )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.green[300],
                    child: Text('Kshs. ${order.orderprice}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )
              ]),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }

  Widget _buildCompletedOrderCard(Order order) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID:  ${order.orderid}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                // Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey[700],
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.ordercategory,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    )),
                // const Text('21-4-2021',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w300,
                //     ))
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Get.to(OrderDetailsScreen(order: order));
                    },
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5)),
                    child: const Text(
                      "Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.green[300],
                    child: Text('Kshs. ${order.orderprice}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )
              ]),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
