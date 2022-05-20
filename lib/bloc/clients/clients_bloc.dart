import 'dart:async';
import 'package:au79_web/cubits/cubit/clientid_cubit.dart';
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
    on<LoadIdEvent>(_onLoadId);
    on<LoadClients>(_onloadClients);
    on<AddClients>(_onAddClients);
    //on<DeleteClients>(_onDeleteClients);
    on<UpdateClients>(_onUpdateClients);
  }

  void _onloadClients(
    LoadClients event,
    Emitter<ClientsState> emit,
  ) {
    _clientSubscription?.cancel();
    _clientSubscription = _clientRepository.getAllClients().listen(
          (clients) => add(
            UpdateClients(clients),
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

  _onAddClients(AddClients event, Emitter<ClientsState> emit) {
    if (state is ClientsLoaded) {
      _clientSubscription?.cancel();
      List<ClientModel> newClient = List.from((state as ClientsLoaded).clients)
        ..add(event.clients);

      _clientRepository.addClient2(newClient);

      emit(ClientsLoaded(clients: newClient));
    }
  }

  Future<void> _onLoadId(LoadIdEvent event, Emitter<ClientsState> emit) async {
    if (state is ClientsLoaded) {
      var courrentState = (await _clientRepository.readIdClient());
      emit(ClientIdExtLoaded(courrentState));
    }
  }
}
