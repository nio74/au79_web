import 'dart:async';
import 'package:au79_web/model/client_model.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final ClientRepository _clientRepository;
  StreamSubscription? _clientSubscription;

  ClientsBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientsLoading()) {
    on<LoadClients>(_onloadClients);
    /* on<AddClients>(_onAddClients);
    on<DeleteClients>(_onDeleteClients); */
    on<UpdateClients>(_onUpdateClients);
  }

  void _onloadClients(
    LoadClients event,
    Emitter<ClientsState> emit,
  ) {
    _clientSubscription?.cancel();
    _clientSubscription = _clientRepository.getAllClients().listen(
          (products) => add(
            UpdateClients(products),
          ),
        );
  }

  void _onUpdateClients(
    UpdateClients event,
    Emitter<ClientsState> emit,
  ) {
    emit(
      ClientsLoaded(clients: event.clients),
    );
  }
}