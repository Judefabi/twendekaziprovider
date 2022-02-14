// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:twendekaziprovider/controllers/product_controller.dart';
// import 'package:twendekaziprovider/model/product_model.dart';
// import 'package:twendekaziprovider/screens/new_product.dart';
// import 'package:twendekaziprovider/screens/orders_screen.dart';
// import 'package:twendekaziprovider/screens/orders_screen_check.dart';

// class ProductScreen extends StatelessWidget {
//   ProductScreen({Key? key}) : super(key: key);
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Services'),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 100,
//                 child: Card(
//                     margin: EdgeInsets.zero,
//                     color: Colors.black,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Get.to(() => NewProductScreen());
//                           },
//                           icon: const Icon(
//                             Icons.add_circle_outline,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const Text(
//                           'Add a new Service',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Get.to(() => OrdersScreen());
//                           },
//                           icon: const Icon(
//                             Icons.add_circle_outline,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//               Expanded(
//                 child: Obx(
//                   () => ListView.builder(
//                     itemCount: productController.products.length,
//                     itemBuilder: (context, index) {
//                       return SizedBox(
//                           height: 210,
//                           child: ProductCard(
//                             product: productController.products[index],
//                             index: index,
//                           ));
//                     },
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final int index;

//   ProductCard({Key? key, required this.product, required this.index})
//       : super(key: key);

//   final ProductController productController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         margin: const EdgeInsets.only(top: 10),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Text(product.productname,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold)),
//               Text(product.productname,
//                   style: const TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.normal)),
//               Expanded(
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 50,
//                       child: Text('Price',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold)),
//                     ),
//                     SizedBox(
//                       width: 175,
//                       child: Slider(
//                         value: 120,
//                         onChanged: (value) {
//                           productController.updateProductPrice(
//                               index, product, value);
//                         },
//                         min: 0,
//                         max: 500,
//                         divisions: 10,
//                         activeColor: Colors.black,
//                         inactiveColor: Colors.black12,
//                         onChangeEnd: (value) {
//                           productController.saveNewProductPrice(
//                               product, 'price', value);
//                         },
//                       ),
//                     ),
//                     const Text('Price',
//                         //'\$${product.productprice.toStringAsFixed(1)}',
//                         style: TextStyle(
//                             fontSize: 12, fontWeight: FontWeight.bold))
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
