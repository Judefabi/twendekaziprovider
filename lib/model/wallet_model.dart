import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WalletTransaction extends Equatable {
  final int id; //we'll be using where id = provider.id
  final int customerId;
  final bool isPayment;
  final DateTime createdAt;
  final int total;
  final String name;
  final String description; //required this will be the order total
  const WalletTransaction(
      {required this.id,
      required this.customerId,
      required this.isPayment,
      required this.createdAt,
      required this.total,
      required this.name,
      required this.description});

  WalletTransaction copyWith(
      {int? id,
      int? customerId,
      bool? isPayment,
      DateTime? createdAt,
      int? total,
      String? name,
      String? description}) {
    return WalletTransaction(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        isPayment: isPayment ?? this.isPayment,
        createdAt: createdAt ?? this.createdAt,
        total: total ?? this.total,
        name: name ?? this.name,
        description: description ?? this.description);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'isPayment': isPayment,
      'createdAt': createdAt,
      'total': total,
      'name': name,
      'description': description,
    };
  }

  factory WalletTransaction.fromSanpshot(DocumentSnapshot snap) {
    return WalletTransaction(
        id: snap['id'],
        customerId: snap['customerId'],
        isPayment: snap['isPayment'],
        createdAt: snap['createdAt'],
        total: snap['total'],
        name: snap['name'],
        description: snap['description']);
  }
  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [id, customerId, isPayment, createdAt, total, name, description];
  }

  static List<WalletTransaction> walletTransaction = [
    WalletTransaction(
        id: 1,
        customerId: 2,
        isPayment: true,
        createdAt: DateTime.now(),
        total: 2000,
        name: 'Laundry',
        description: 'Laundry services'),
    WalletTransaction(
        id: 1,
        customerId: 3,
        isPayment: false,
        createdAt: DateTime.now(),
        total: 1500,
        name: 'Withdrawal',
        description: 'Withdrawal to bank'),
    WalletTransaction(
        id: 1,
        customerId: 4,
        isPayment: false,
        createdAt: DateTime.now(),
        total: 1200,
        name: 'Withdrawal',
        description: 'Withdrawal to bank'),
    WalletTransaction(
        id: 1,
        customerId: 5,
        isPayment: true,
        createdAt: DateTime.now(),
        total: 300,
        name: 'Gardening',
        description: 'Clearing bushes'),
    WalletTransaction(
        id: 1,
        customerId: 6,
        isPayment: true,
        createdAt: DateTime.now(),
        total: 400,
        name: 'Car repair',
        description: 'Oil change')
  ];
}
