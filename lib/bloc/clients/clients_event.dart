part of 'clients_bloc.dart';

abstract class ClientsEvent extends Equatable {
  const ClientsEvent();

  @override
  List<Object> get props => [];
}

class ClientBlocLoadIdEvent extends ClientsEvent {}

class ClientBlocEventInit extends ClientsEvent {
  final List<ClientModel> clients;

  const ClientBlocEventInit({this.clients = const <ClientModel>[]});
  @override
  List<Object> get props => [clients];
}

class ClientBlocEventUpdateClients extends ClientsEvent {
  final List<ClientModel> clients;

  const ClientBlocEventUpdateClients(this.clients);
  @override
  List<Object> get props => [clients];
}

class ClientBlocEventAddClients extends ClientsEvent {
  final ClientModel clients;
  const ClientBlocEventAddClients({
    required this.clients,
  });
  @override
  List<Object> get props => [clients];
}

class ClientBlocEventDeleteClients extends ClientsEvent {
  final ClientModel clients;
  const ClientBlocEventDeleteClients({
    required this.clients,
  });
  @override
  List<Object> get props => [clients];
}

class ClientBlocEventSaveExternalId extends ClientsEvent {}
