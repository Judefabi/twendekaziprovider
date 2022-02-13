import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/controllers/order_controller.dart';
import 'package:twendekaziprovider/controllers/product_controller.dart';
import 'package:twendekaziprovider/model/product_model.dart';
import 'package:intl/intl.dart';
import 'package:twendekaziprovider/model/product_model.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

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
          title: const Text('Products',
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
        body: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productController.products[index].productname),
                        const Icon(Icons.bookmark_add_outlined,
                            color: Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Hours Needed',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            SizedBox(height: 15),
                            Text('3-5 Hrs',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('Complexity',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                )),
                            SizedBox(height: 15),
                            Text('Very Complex',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Experience Level',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            )),
                        SizedBox(height: 15),
                        Text('Intermediate',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(productController.products[index].productdescription,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))
                  ])),
            );
          },
        ));
  }
}
