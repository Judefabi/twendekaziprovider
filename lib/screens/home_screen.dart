import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/controllers/product_controller.dart';
import 'package:twendekaziprovider/controllers/service_controller.dart';
import 'package:twendekaziprovider/model/product_model.dart';
import 'package:twendekaziprovider/model/product_model.dart';
import 'package:twendekaziprovider/model/services_model.dart';
import 'package:twendekaziprovider/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twendekaziprovider/model/wallet_model.dart';
import 'package:intl/intl.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final ServiceController serviceController = Get.put(ServiceController());
  final ProductController productController = Get.put(ProductController());
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final Service services;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const urlImage =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';
    return Scaffold(
        // appBar:
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 75,
            ),
            //app bar
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                height: 50,
                child: const Icon(
                  Icons.menu,
                  size: 40,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Your Kazi Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //search area
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for jobs"),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                  )
                ])),
            const SizedBox(
              height: 50,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'For You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 160,
              child: StreamBuilder<List<Service>>(
                stream: getServices(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final services = snapshot.data!;
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: services.map(ServicesCard).toList());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //Job Categories
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Latest Jobs',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            // const SizedBox(height: 10),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, bottom: 10.0, right: 10.0),
                child: Container(
                  height: 500,
                  child: StreamBuilder<List<Product>>(
                    stream: getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final products = snapshot.data!;
                        return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: products.map(recentPosts).toList());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            )
          ]),
        ));
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  Stream<List<Service>> getServices() {
    return _firebaseFirestore
        .collection('providers')
        .doc('3NwtKCoqq4TzT9OSMJxbxMMAJ283')
        .collection('services')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Service.fromJson(doc.data())).toList());
  }

  Widget recentPosts(Product product) {
    return InkWell(
      onTap: () {},
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
                            product.productname,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${product.productid}',
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
                                'Kshs. ${product.productprice}',
                                style: const TextStyle(color: Colors.white),
                              )))
                    ]))),
      ),
    );
  }

  Widget ServicesCard(Service services) {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                width: 250,
                padding: const EdgeInsets.all(12.0),
                color: Colors.grey[800],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 60,
                              child: Container(
                                color: Colors.white,
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                services.serviceexpertise,
                                style: const TextStyle(color: Colors.white),
                              ),
                              color: Colors.grey[500],
                            ),
                          )
                        ]),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        services.servicename,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Kshs. ${services.servicerate}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}


// ActionChip(
//     label: const Text("Logout"),
//     onPressed: () {
//       logout(context);
//     }),