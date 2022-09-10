part of 'clients_bloc.dart';

abstract class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object> get props => [];
}

class ClientBlocStatesLoading extends ClientsState {}

class ClientsBlocStateLoaded extends ClientsState {
  final List<ClientModel> clients;
  const ClientsBlocStateLoaded(
      {this.clients =
          const <ClientModel>[]}); // pass to costructor an empty lyst
  @override
  List<Object> get props => [clients];
}

class ClientBlocStateIndexExtLoaded extends ClientsState {
  final int idNuovo;

  const ClientBlocStateIndexExtLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
