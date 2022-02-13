import 'package:get/get.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/model/services_model.dart';
import 'package:twendekaziprovider/services/database_service.dart';

class ServiceController extends GetxController {
  // final DatabaseService database = DatabaseService();

  var services = <Service>[].obs;

  @override
  void onInit() {
    // pendingOrders.bindStream(database.getpendingOrders());
    super.onInit();
  }

  // void updateOrder(
  //   Service order,
  //   String field,
  //   bool value,
  // ) {
  //   database.updateOrder(order, field, value);
  // }
}
