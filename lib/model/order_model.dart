// import 'dart:convert';

import 'package:equatable/equatable.dart';

// var uuid = const Uuid();

class Order extends Equatable {
  final String ordername;
  final String orderid;
  final String orderdescription;
  double orderprice;
  final String orderdetails;
  DateTime ordercreatedAt = DateTime.now();
  final String ordercategory;
  final String orderownerid;
  DateTime orderdate;

  Order({
    required this.ordername,
    required this.orderid,
    required this.orderdescription,
    this.orderprice = 0,
    required this.orderdetails,
    required this.ordercreatedAt,
    required this.ordercategory,
    required this.orderownerid,
    required this.orderdate,
  });

  @override
  List<Object> get props {
    return [
      ordername,
      orderid,
      orderdescription,
      orderprice,
      orderdetails,
      ordercreatedAt,
      ordercategory,
      orderownerid,
      orderdate,
    ];
  }

  Order copyWith({
    String? ordername,
    String? orderid,
    String? orderdescription,
    double? orderprice,
    String? orderdetails,
    DateTime? ordercreatedAt,
    String? ordercategory,
    String? orderownerid,
    DateTime? orderdate,
  }) {
    return Order(
      ordername: ordername ?? this.ordername,
      orderid: orderid ?? this.orderid,
      orderdescription: orderdescription ?? this.orderdescription,
      orderprice: orderprice ?? this.orderprice,
      orderdetails: orderdetails ?? this.orderdetails,
      ordercreatedAt: ordercreatedAt ?? this.ordercreatedAt,
      ordercategory: ordercategory ?? this.ordercategory,
      orderownerid: orderownerid ?? this.orderownerid,
      orderdate: orderdate ?? this.orderdate,
    );
  }

  Map<String, dynamic> toJson() => {
        'ordername': ordername,
        'orderid': orderid,
        'orderdescription': orderdescription,
        'orderprice': orderprice,
        'orderdetails': orderdetails,
        'ordercreatedAt': ordercreatedAt,
        'ordercategory': ordercategory,
        'orderownerid': orderownerid,
        'orderdate': orderdate,
      };

  static Order fromJson(Map<String, dynamic> json) => Order(
        ordername: json['ordername'],
        orderid: json['orderid'],
        orderdescription: json['orderdescription'],
        orderprice: json['orderprice'],
        orderdetails: json['orderdetails'],
        ordercreatedAt: json['ordercreatedAt'].toDate(),
        ordercategory: json['ordercategory'],
        orderownerid: json['orderownerid'],
        orderdate: json['orderdate'].toDate(),
      );
}
