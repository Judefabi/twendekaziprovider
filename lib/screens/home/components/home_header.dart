import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/screens/orders_screen.dart';
// import 'package:twendekaziprovider/screens/myorders_screen.dart';

import '../../../size_config.dart';
import 'package:twendekaziprovider/screens/notifications_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            numOfitem: 0,
            svgSrc: "assets/icons/cart.svg",
            press: () {
              // Get.to( MyOrdersScreen());
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/bell.svg",
            numOfitem: 0,
            press: () {
              Get.to(const NotificationScreen());
            },
          ),
        ],
      ),
    );
  }
}
