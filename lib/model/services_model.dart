import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Service extends Equatable{
  final int serviceId;
  // final String
      // userid; //we'll be using where serviceId = provserviceIder.serviceId
  final String servicedescription;
  final String servicename;
  final int servicerate;
  final String serviceexpertise; 
  const Service({
    required this.serviceId,
    // required this.userid,
    required this.servicedescription,
    required this.servicename,
    required this.servicerate,
    required this.serviceexpertise,
  });


  @override
  List<Object> get props {
    return [
      serviceId,
      // userid,
      servicedescription,
      servicename,
      servicerate,
      serviceexpertise
    ];
  }



  Service copyWith({
    int? serviceId,
    // String? userid,
    String? servicedescription,
    String? servicename,
    int? servicerate,
    String? serviceexpertise,
  }) {
    return Service(
      serviceId: serviceId ?? this.serviceId,
      // // // userid: userid ?? this.userid,
      servicedescription: servicedescription ?? this.servicedescription,
      servicename: servicename ?? this.servicename,
      servicerate: servicerate ?? this.servicerate,
      serviceexpertise: serviceexpertise ?? this.serviceexpertise,
    );
  }

  Map<String, dynamic> toJson() => {
        'serviceId': serviceId,
        // // 'userid': userid,
        'servicedescription': servicedescription,
        'servicename': servicename,
        'servicerate': servicerate,
        'serviceexpertise': serviceexpertise,
      };

  static Service fromJson(Map<String, dynamic> json) =>  Service(
        serviceId: json['serviceId'],
        // // userid: json['userid'],
        servicedescription: json['servicedescription'],
        servicename: json['servicename'],
        servicerate: json['servicerate'],
        serviceexpertise: json['serviceexpertise']);
  
// @override
//   bool get stringify => true;

//   static List<Service> services = [
//     const Service(
//         serviceId: 1,
        // userid: '23',
//         servicedescription: '2',
//         servicename: 'Laundry',
//         servicerate: 450,
//         serviceexpertise: 'Expert'),
//     const Service(
//         serviceId: 1,
        // userid: '23',
//         servicedescription: '3',
//         servicename: 'Plumbing',
//         servicerate: 500,
//         serviceexpertise: 'Novice'),
//     const Service(
//         serviceId: 1,
        // userid: '23',
//         servicedescription: '4',
//         servicename: 'Pruning',
//         servicerate: 200,
//         serviceexpertise: 'Expert'),
//     const Service(
//         serviceId: 1,
        // userid: '23',
//         servicedescription: '5',
//         servicename: 'Gardening',
//         servicerate: 200,
//         serviceexpertise: 'Expert'),
//     const Service(
//         serviceId: 1,
        // userid: '23',
//         servicedescription: '6',
//         servicename: 'Car repair',
//         servicerate: 1300,
//         serviceexpertise: 'Expert')
//   ];

}