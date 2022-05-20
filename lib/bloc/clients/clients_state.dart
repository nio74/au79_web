part of 'clients_bloc.dart';

abstract class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object> get props => [];
}

class ClientsLoading extends ClientsState {}

class ClientsLoaded extends ClientsState {
  final List<ClientModel> clients;
  const ClientsLoaded(
      {this.clients =
          const <ClientModel>[]}); // pass to costructor an empty lyst
  @override
  List<Object> get props => [clients];
}

class ClientIdExtLoaded extends ClientsState {
  final String idNuovo;

  const ClientIdExtLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
