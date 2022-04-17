import 'package:flutter/material.dart';
import 'package:twendekaziprovider/screens/home/home_screen.dart';
import 'package:twendekaziprovider/screens/notifications_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';
import 'package:twendekaziprovider/dead%20code/orders_screen_check.dart';
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
        return const ProfileScreen();
      case 0:
        return HomeScreen();
    }
  }
}
