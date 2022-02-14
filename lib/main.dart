import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/navigation/bottom_navigation_bar.dart';
import 'package:twendekaziprovider/screens/home_screen.dart';
import 'package:twendekaziprovider/screens/new_service.dart';
import 'package:twendekaziprovider/screens/notifications_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';
import 'package:twendekaziprovider/dead%20code/orders_screen_check.dart';
import 'package:twendekaziprovider/dead%20code/products_screen.dart';
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
      home: const BottomNavBar(),
      getPages: [
        GetPage(name: '/products/new', page: () => NewServiceScreen()),
        GetPage(name: '/orders', page: () => OrdersScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen())
      ],
    );
  }
}
