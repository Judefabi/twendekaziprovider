import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text('...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
        actions: [
          const CircleAvatar(
              radius: 20, backgroundImage: NetworkImage(urlImage)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.playlist_play_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(32))),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Twendekazi',
                          style: TextStyle(
                              fontSize: 25,
                              // fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      const SizedBox(height: 5),
                      const Text('--the kazi home',
                          style: TextStyle(
                              fontSize: 36,
                              // fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(244, 243, 243, 1)),
                        child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black87),
                                hintText: 'Find jobs',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                      ),
                      const SizedBox(height: 25),
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Your Services',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            child: const Text(
                              'Add Service',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Service.services.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  height: 100,
                                  child: categoryItem(
                                    services: Service.services[index],
                                  ));
                            }),
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Latest Jobs',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            child: const Text(
                              'Browse All',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 500,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: Service.services.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  height: 100,
                                  child: recentPosts(
                                    product: Product.product[index],
                                  ));
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              )
            ]),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}

class categoryItem extends StatelessWidget {
  const categoryItem({
    Key? key,
    required this.services,
  }) : super(key: key);

  final Service services;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 3,
      child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/logo.png')),
          ),
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              services.servicename,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: const [
                    0.1,
                    0.9
                  ],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1)
                  ]),
            ),
          )),
    );
  }
}

class recentPosts extends StatelessWidget {
  const recentPosts({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: const CircleAvatar(
            child: Text('TK'),
            backgroundColor: Colors.black87,
          ),
          title: Text(product.productname,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          subtitle: Text(product.productname,
              style: const TextStyle(color: Colors.black45, fontSize: 16)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Kshs. ${product.productname}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              // Text(DateFormat('dd-MM-yy').format(product.productcreatedAt),
              //     style: const TextStyle(
              //         fontSize: 12,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }
}


// ActionChip(
//     label: const Text("Logout"),
//     onPressed: () {
//       logout(context);
//     }),
