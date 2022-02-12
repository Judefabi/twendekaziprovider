import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twendekaziprovider/model/order_model.dart';
import 'package:twendekaziprovider/model/product_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Stream<List<Product>> getProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }
  // Stream<List<Product>> getServices() {
  //   return _firebaseFirestore.collection('products').snapshots().map(
  //       (snapshot) =>
  //           snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  // }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection('products').add(product.toJson());
  }

  Future<void> updateField(Product product, String field, dynamic newValue) {
    return _firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.productname)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Future<void> updateOrder(Order order, String field, dynamic newValue) {
    return _firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }

  // Stream<List<Order>> getpendingOrders() {
  //   return _firebaseFirestore
  //       .collection('orders')
  //       .where('isDelivered', isEqualTo: false)
  //       .where('isCancelled', isEqualTo: false)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
  //   });
  // }
}
