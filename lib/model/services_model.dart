import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int
      serviceId; //we'll be using where serviceId = provserviceIder.serviceId
  final int providerId;
  final String servicename;
  final int servicerate; //required this will be the order total
  const Service(
      {required this.serviceId,
      required this.providerId,
      required this.servicename,
      required this.servicerate});

  Service copyWith(
      {int? serviceId,
      int? providerId,
      String? servicename,
      int? servicerate}) {
    return Service(
        serviceId: serviceId ?? this.serviceId,
        providerId: providerId ?? this.providerId,
        servicename: servicename ?? this.servicename,
        servicerate: servicerate ?? this.servicerate);
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'providerId': providerId,
      'servicename': servicename,
      'servicerate': servicerate,
    };
  }

  factory Service.fromSanpshot(DocumentSnapshot snap) {
    return Service(
        serviceId: snap['serviceId'],
        providerId: snap['providerId'],
        servicename: snap['servicename'],
        servicerate: snap['servicerate']);
  }
  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [serviceId, providerId, servicename, servicerate];
  }

  static List<Service> services = [
    const Service(
        serviceId: 1, providerId: 2, servicename: 'Laundry', servicerate: 450),
    const Service(
        serviceId: 1, providerId: 3, servicename: 'Plumbing', servicerate: 500),
    const Service(
        serviceId: 1, providerId: 4, servicename: 'Pruning', servicerate: 200),
    const Service(
        serviceId: 1,
        providerId: 5,
        servicename: 'Gardening',
        servicerate: 200),
    const Service(
        serviceId: 1,
        providerId: 6,
        servicename: 'Car repair',
        servicerate: 1300)
  ];
}
