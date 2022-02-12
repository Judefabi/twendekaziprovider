import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int
      serviceId; //we'll be using where serviceId = provserviceIder.serviceId
  final int providerId;
  final String servicename;
  final String description; //required this will be the order total
  const Service(
      {required this.serviceId,
      required this.providerId,
      required this.servicename,
      required this.description});

  Service copyWith(
      {int? serviceId,
      int? providerId,
      String? servicename,
      String? description}) {
    return Service(
        serviceId: serviceId ?? this.serviceId,
        providerId: providerId ?? this.providerId,
        servicename: servicename ?? this.servicename,
        description: description ?? this.description);
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'providerId': providerId,
      'servicename': servicename,
      'description': description,
    };
  }

  factory Service.fromSanpshot(DocumentSnapshot snap) {
    return Service(
        serviceId: snap['serviceId'],
        providerId: snap['providerId'],
        servicename: snap['servicename'],
        description: snap['description']);
  }
  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [serviceId, providerId, servicename, description];
  }

  static List<Service> services = [
    const Service(
        serviceId: 1,
        providerId: 2,
        servicename: 'Laundry',
        description:
            'Laundry services Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum'),
    const Service(
        serviceId: 1,
        providerId: 3,
        servicename: 'Withdrawal',
        description:
            'Withdrawal to bank Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum'),
    const Service(
        serviceId: 1,
        providerId: 4,
        servicename: 'Withdrawal',
        description:
            'Withdrawal to bank Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum'),
    const Service(
        serviceId: 1,
        providerId: 5,
        servicename: 'Gardening',
        description:
            'Clearing bushes Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum'),
    const Service(
        serviceId: 1,
        providerId: 6,
        servicename: 'Car repair',
        description:
            'Oil change Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum')
  ];
}
