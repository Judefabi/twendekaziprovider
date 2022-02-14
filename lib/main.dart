import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/navigation/bottom_navigation_bar.dart';
import 'package:twendekaziprovider/screens/home_screen.dart';
import 'package:twendekaziprovider/screens/login_screen.dart';
import 'package:twendekaziprovider/screens/new_product.dart';
import 'package:twendekaziprovider/screens/notifications_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen_check.dart';
import 'package:twendekaziprovider/screens/products_screen.dart';
import 'package:twendekaziprovider/screens/profile_screen.dart';
import 'package:twendekaziprovider/screens/wallet_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      getPages: [
        GetPage(name: '/products', page: () => ProductScreen()),
        GetPage(name: '/products/new', page: () => NewProductScreen()),
        GetPage(name: '/orders', page: () => OrdersScreenCheck()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen())
      ],
    );
  }
}
