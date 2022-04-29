import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final int id;
  final String surname;
  final String nameClient;
  final String address;

  const ClientModel({
    required this.id,
    required this.surname,
    required this.nameClient,
    required this.address,
  });

  @override
  List<Object?> get props => [id, surname, nameClient, address];

  ClientModel copyWith({
    int? id,
    String? surname,
    String? nameClient,
    String? address,
  }) {
    return ClientModel(
      id: id ?? this.id,
      surname: surname ?? this.surname,
      nameClient: nameClient ?? this.nameClient,
      address: address ?? this.address,
    );
  }
}

final clientsList = [
  ClientModel(
      id: 1, surname: 'Roggi', nameClient: "Antonio", address: "Via Roma 94"),
  ClientModel(
      id: 2,
      surname: 'Buoncompagni',
      nameClient: "Giovanni",
      address: "Via pinco 37 Verona"),
];
