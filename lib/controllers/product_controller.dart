// import 'package:get/get.dart';
// import 'package:twendekaziprovider/model/product_model.dart';
// import 'package:twendekaziprovider/services/database_service.dart';

// class ProductController extends GetxController {
//   // List<Product> products = Product.products.obs;

//   var products = <Product>[].obs;

//   @override
//   void onInit() {
//     // products.bindStream(database.getServices());
//     super.onInit();
//   }

//   var newProduct = {}.obs;

//   get price => newProduct['price'];

//   void updateProductPrice(
//     int index,
//     Product product,
//     double value,
//   ) {
//     // product.productprice = value;
//     products[index] = product;
//   }

//   void saveNewProductPrice(
//     Product product,
//     String field,
//     double value,
//   ) {
//     database.updateField(product, field, value);
//   }
// }
