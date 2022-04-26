import 'dart:async';
import 'package:au79_web/model/client_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsBloc() : super(ClientsLoading()) {
    on<LoadClients>(_onloadClients);
    on<AddClients>(_onAddClients);
    on<DeleteClients>(_onDeleteClients);
    on<UpdateClients>(_onUpdateClients);
  }

  FutureOr<void> _onloadClients(LoadClients event, Emitter<ClientsState> emit) {
    emit(ClientsLoaded(clients: event.clients));
  }

  FutureOr<void> _onAddClients(AddClients event, Emitter<ClientsState> emit) {}

  FutureOr<void> _onDeleteClients(
      DeleteClients event, Emitter<ClientsState> emit) {}

  FutureOr<void> _onUpdateClients(
      UpdateClients event, Emitter<ClientsState> emit) {}
}
