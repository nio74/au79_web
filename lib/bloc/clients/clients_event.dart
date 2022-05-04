part of 'clients_bloc.dart';

abstract class ClientsEvent extends Equatable {
  const ClientsEvent();

  @override
  List<Object> get props => [];
}

class LoadClients extends ClientsEvent {
  final List<ClientModel> clients;

  const LoadClients({this.clients = const <ClientModel>[]});
  @override
  List<Object> get props => [clients];
}

class UpdateClients extends ClientsEvent {
  final List<ClientModel> clients;

  const UpdateClients(this.clients);
  @override
  List<Object> get props => [clients];
}

class AddClients extends ClientsEvent {
  final ClientModel clients;
  const AddClients({
    required this.clients,
  });
  @override
  List<Object> get props => [clients];
}

class DeleteClients extends ClientsEvent {
  final ClientModel clients;
  const DeleteClients({
    required this.clients,
  });
  @override
  List<Object> get props => [clients];
}
