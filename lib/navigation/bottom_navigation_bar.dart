import 'package:flutter/material.dart';
import 'package:twendekaziprovider/screens/home_screen.dart';
import 'package:twendekaziprovider/screens/notifications_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen_check.dart';
import 'package:twendekaziprovider/screens/profile_screen.dart';
import 'package:twendekaziprovider/screens/wallet_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_rounded),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
          ),
        ],
      ),
    );
  }

  buildBody() {
    switch (_currentIndex) {
      case 1:
        return OrdersScreen();
      case 2:
        return const NotificationScreen();
      case 3:
        return const ProfileScreen();
      case 4:
        return const WalletScreen();

      case 0:
        return const HomeScreen();
    }
  }
}
