import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/screens/order_details.dart';
// import 'package:shop_app/components/product_card.dart';
// import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularOrders extends StatefulWidget {
  @override
  State<PopularOrders> createState() => _PopularOrdersState();
}

class _PopularOrdersState extends State<PopularOrders> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "New Orders", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                child: StreamBuilder<List<Order>>(
                  stream: getOrders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final orders = snapshot.data!;
                      return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: orders.map(_topOrders).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList());
  }

  Widget _topOrders(Order order) {
    return InkWell(
      onTap: () {
        Get.to(OrderDetailsScreen(order: order));
      },
      child: Card(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                color: Colors.grey[300],
                                height: 50,
                                child: Container())),
                        const SizedBox(width: 10),
                        Column(children: [
                          Text(
                            order.ordername,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            order.ordercategory,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          )
                        ]),
                      ]),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.green[300],
                              child: Text(
                                'Kshs. ${order.orderprice}',
                                style: const TextStyle(color: Colors.white),
                              )))
                    ]))),
      ),
    );
  }
}
