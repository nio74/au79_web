import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final int id;
  final String surname;
  final String name;
  final String indirizzo;

  const ClientModel({
    required this.id,
    required this.surname,
    required this.name,
    required this.indirizzo,
  });

  @override
  List<Object?> get props => [id, surname, name, indirizzo];

  ClientModel copyWith({
    int? id,
    String? surname,
    String? name,
    String? indirizzo,
  }) {
    return ClientModel(
      id: id ?? this.id,
      surname: surname ?? this.surname,
      name: name ?? this.name,
      indirizzo: indirizzo ?? this.indirizzo,
    );
  }
}

final clientsList = [
  ClientModel(
      id: 1, surname: 'Roggi', name: "Antonio", indirizzo: "Via Roma 94"),
  ClientModel(
      id: 2,
      surname: 'Buoncompagni',
      name: "Giovanni",
      indirizzo: "Via pinco 37 Verona"),
];
