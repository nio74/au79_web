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

  @override
  List<Object?> get props => [id, nameClient, address];

  static ClientModel fromSnapshopt(DocumentSnapshot snap) {
    ClientModel clientModel = ClientModel(
        id: snap['id'],
        nameClient: snap['nameClient'],
        address: snap['address']);
    return clientModel;
  }

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
}

final clientsList = [
  ClientModel(id: 1, nameClient: "Antonio", address: "Via Roma 94"),
  ClientModel(id: 2, nameClient: "Giovanni", address: "Via pinco 37 Verona"),
];
