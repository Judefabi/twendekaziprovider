// import 'dart:convert';

import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';
// var uuid = const Uuid();

class Bid extends Equatable {
  final String ordername;
  final String orderid;
  // String orderid = const Uuid().v1();
  final String orderdescription;
  double orderprice;
  final String orderdetails;
  DateTime ordercreatedAt = DateTime.now();
  final String ordercategory;
  final String orderownerid;
  DateTime orderdate;
  String providerid;
  bool isAssigned;

  Bid(
      {required this.ordername,
      required this.orderid,
      required this.orderdescription,
      this.orderprice = 0,
      required this.orderdetails,
      required this.ordercreatedAt,
      required this.ordercategory,
      required this.orderownerid,
      required this.orderdate,
      required this.providerid,
      required this.isAssigned,});

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
      providerid,
      isAssigned,
    ];
  }

  // Order copyWith({
  //   String? ordername,
  //   String? orderid,
  //   String? orderdescription,
  //   double? orderprice,
  //   String? orderdetails,
  //   DateTime? ordercreatedAt,
  //   String? ordercategory,
  //   String? orderownerid,
  //   DateTime? orderdate,
  //   String? providerid,
  //   String? isAssigned,
  // }) {
  //   return Order(
  //     ordername: ordername ?? this.ordername,
  //     orderid: orderid ?? this.orderid,
  //     orderdescription: orderdescription ?? this.orderdescription,
  //     orderprice: orderprice ?? this.orderprice,
  //     orderdetails: orderdetails ?? this.orderdetails,
  //     ordercreatedAt: ordercreatedAt ?? this.ordercreatedAt,
  //     ordercategory: ordercategory ?? this.ordercategory,
  //     orderownerid: orderownerid ?? this.orderownerid,
  //     orderdate: orderdate ?? this.orderdate,
  //     providerid: providerid ?? this.providerid,
  //     isAssigned: isAssigned!,
  //   );
  // }

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
        'providerid': providerid,
        'isAssigned' : isAssigned,
      };

  static Bid fromJson(Map<String, dynamic> json) => Bid(
        ordername: json['ordername'],
        orderid: json['orderid'],
        orderdescription: json['orderdescription'],
        orderprice: json['orderprice'],
        orderdetails: json['orderdetails'],
        ordercreatedAt: json['ordercreatedAt'].toDate(),
        ordercategory: json['ordercategory'],
        orderownerid: json['orderownerid'],
        orderdate: json['orderdate'].toDate(),
        providerid: json['providerid'],
        isAssigned: json['isAssigned'],
      );
}
