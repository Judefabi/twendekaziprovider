import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twendekaziprovider/controllers/product_controller.dart';
import 'package:twendekaziprovider/model/product_model.dart';
import 'package:twendekaziprovider/services/database_service.dart';

class NewServiceScreen extends StatelessWidget {
  NewServiceScreen({Key? key}) : super(key: key);
  // final ProductController productController = Get.find();
  final ProductController productController = Get.put(ProductController());

  DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Service'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.black,
                      child: Row(
                        children: const [
                          // IconButton(
                          //   onPressed: () {
                          //     Get.to(() => const NewServiceScreen());
                          //   },
                          //   icon: const Icon(
                          //     Icons.add_circle_outline,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          Text(
                            'Create Service',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Service Description:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField('Product Name', 'name', productController),
                _buildTextFormField('Product ID', 'id', productController),
                _buildTextFormField(
                    'Product Description', 'description', productController),
                const SizedBox(height: 10),
                _buildSlider('Price', 'price', productController,
                    productController.price),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // print(productController.newProduct);
                        database.addProduct(Product(
                          productname: productController.newProduct['id'],
                          productid:
                              int.parse(productController.newProduct['id']),
                          productdescription:
                              productController.newProduct['description'],
                          productprice: productController.newProduct['price'],
                          // productcreatedAt: productController
                          // .newProduct['productcreatedAt']
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Row _buildSlider(String title, String name,
      ProductController productController, double? controllerValue) {
    return Row(
      children: [
        const SizedBox(
          width: 75,
          child: Text(
            'Price',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
            min: 0,
            max: 500,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct
            .update(name, (_) => value, ifAbsent: () => value);
      },
    );
  }
}
