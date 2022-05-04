import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final String id;
  final String nameClient;
  final String address;

  const ClientModel({
    required this.id,
    required this.nameClient,
    required this.address,
  });

  @override
  List<Object?> get props => [id, nameClient, address];

  static ClientModel fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data();
    ClientModel clientModel = ClientModel(
      id: snap.data().toString().contains('id') ? snap.get('id') : '', //Strin
      nameClient: snap.data().toString().contains('nameClient')
          ? snap.get('nameClient')
          : '',
      address:
          snap.data().toString().contains('address') ? snap.get('address') : '',
    );
    return clientModel;
  }
}

final clientsList = [
  ClientModel(id: '1', nameClient: "Antonio", address: "Via Roma 94"),
  ClientModel(id: '2', nameClient: "Giovanni", address: "Via pinco 37 Verona"),
];
