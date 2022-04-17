import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/screens/home/components/categories.dart';
import 'package:twendekaziprovider/screens/home/components/discount_banner.dart';
import 'package:twendekaziprovider/screens/home/components/home_header.dart';
import 'package:twendekaziprovider/screens/home/components/popular_product.dart';
import 'package:twendekaziprovider/screens/home/components/special_offers.dart';
import 'package:twendekaziprovider/screens/myorders_screen.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to( MyOrdersScreen());
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.work_rounded, color: Colors.white)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),

            // const SizedBox(
            //   height: 55,
            // ),
            const SizedBox(height: 20),
            const HomeHeader(),
            const SizedBox(height: 10),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            const SizedBox(height: 30),
            PopularOrders(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
