import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final int id;
  final String nameClient;
  final String address;

  const ClientModel({
    required this.id,
    required this.nameClient,
    required this.address,
  });

  ClientModel copyWith({
    int? id,
    String? nameClient,
    String? address,
  }) {
    return ClientModel(
      id: id ?? this.id,
      nameClient: nameClient ?? this.nameClient,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [id, nameClient, address];

  factory ClientModel.fromSnapshot(DocumentSnapshot snap) {
    return ClientModel(
      id: snap['id'],
      nameClient: snap['nameClient'],
      address: snap['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameClient': nameClient,
      'address': address,
    };
  }
}
