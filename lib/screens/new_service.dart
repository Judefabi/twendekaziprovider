// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:twendekaziprovider/controllers/product_controller.dart';
// import 'package:twendekaziprovider/model/product_model.dart';
// import 'package:twendekaziprovider/services/database_service.dart';

// class NewServiceScreen extends StatelessWidget {
//   NewServiceScreen({Key? key}) : super(key: key);
//   // final   = Get.find();
//   final   = Get.put(());

//   // DatabaseService database = DatabaseService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Service'),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Obx(
//             () => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 100,
//                   child: Card(
//                       margin: EdgeInsets.zero,
//                       color: Colors.black,
//                       child: Row(
//                         children: const [
//                           // IconButton(
//                           //   onPressed: () {
//                           //     Get.to(() => const NewServiceScreen());
//                           //   },
//                           //   icon: const Icon(
//                           //     Icons.add_circle_outline,
//                           //     color: Colors.white,
//                           //   ),
//                           // ),
//                           Text(
//                             'Create Service',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Service Description:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 _buildTextFormField('Product Name', 'name', ),
//                 _buildTextFormField('Product ID', 'id', ),
//                 _buildTextFormField(
//                     'Product Description', 'description', ),
//                 const SizedBox(height: 10),
//                 _buildSlider('Price', 'price', ,
//                     .prce),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Center(
//                   child: ElevatedButton(
//                       onPressed: () {
                        
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.black,
//                       ),
//                       child: const Text(
//                         'Save',
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       )),
//                 )
//               ],
//             ),
//           )),
//     );
//   }

//   Row _buildSlider(String title, String name,
//       double? controllerValue) {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 75,
//           child: Text(
//             'Price',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Expanded(
//           child: Slider(
//             value: (controllerValue == null) ? 0 : controllerValue,
//             onChanged: (value) {
//               .newProduct.update(
//                 name,
//                 (_) => value,
//                 ifAbsent: () => value,
//               );
//             },
//             min: 0,
//             max: 500,
//             divisions: 10,
//             activeColor: Colors.black,
//             inactiveColor: Colors.black12,
//           ),
//         ),
//       ],
//     );
//   }

//   TextFormField _buildTextFormField(
//     String hintText,
//     String name,
    
//   ) {
//     return TextFormField(
//       decoration: InputDecoration(hintText: hintText),
//       onChanged: (value) {
        
//       },
//     );
//   }
// }
