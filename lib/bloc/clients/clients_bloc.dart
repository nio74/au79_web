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
    on<ClientBlocLoadIdEvent>(_onLoadId);
    on<ClientBlocEventInit>(_onloadClients);
    on<ClientBlocEventAddClients>(_onAddClients);
    //on<DeleteClients>(_onDeleteClients);
    on<ClientBlocEventUpdateClients>(_onUpdateClients);
  }

  void _onloadClients(
    ClientBlocEventInit event,
    Emitter<ClientsState> emit,
  ) {
    _clientSubscription?.cancel();
    _clientSubscription = _clientRepository.getAllClients().listen(
          (clients) => add(
            ClientBlocEventUpdateClients(clients),
          ),
        );
  }

  void _onUpdateClients(
    ClientBlocEventUpdateClients event,
    Emitter<ClientsState> emit,
  ) {
    emit(
      ClientsLoaded(clients: event.clients),
    );
  }

  _onAddClients(ClientBlocEventAddClients event, Emitter<ClientsState> emit) {
    if (state is ClientsLoaded) {
      _clientSubscription?.cancel();
      List<ClientModel> newClient = List.from((state as ClientsLoaded).clients)
        ..add(event.clients);

      _clientRepository.addClient2(newClient);

      emit(ClientsLoaded(clients: newClient));
    } else {
      print('_onAddClients not work');
    }
  }

  Future<void> _onLoadId(
      ClientBlocLoadIdEvent event, Emitter<ClientsState> emit) async {
    var courrentState = (_clientRepository.readIdClient());
    if (state != ClientsLoading) {
      emit(ClientIdExtLoaded(await courrentState));
    }
  }
}
