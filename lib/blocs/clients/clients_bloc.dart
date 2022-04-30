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
    on<AddClients>(_onAddClients);
    on<DeleteClients>(_onDeleteClients);
    on<UpdateClients>(_onUpdateClients);
  }

  /* @override
  Stream<ClientsState> mapEventToState(
    ClientsEvent event,
  ) async* {
    if (event is LoadClients) {
      yield* _mapLoadClientsToState();
    }
    if (event is UpdateClients) {
      yield* _mapUpdateCategoriesToState(event);
    }
  } */

  void _onloadClients(LoadClients event, Emitter<ClientsState> emit) {
    _clientSubscription?.cancel();
    _clientSubscription =
        _clientRepository.getAllClients().listen((clientProduct) {
      UpdateClients(clientProduct);
    });
  }

  /* FutureOr<void> _onloadClients(LoadClients event, Emitter<ClientsState> emit) {
    emit(ClientsLoaded(clients: event.clients));
  }
 */

  FutureOr<void> _onAddClients(AddClients event, Emitter<ClientsState> emit) {}

  FutureOr<void> _onDeleteClients(
      DeleteClients event, Emitter<ClientsState> emit) {}

  FutureOr<void> _onUpdateClients(
      UpdateClients event, Emitter<ClientsState> emit) {}

  Stream<ClientsState> _mapLoadClientsToState() async* {
    _clientSubscription?.cancel();
    _clientSubscription = _clientRepository.getAllClients().listen(
          (clients) => add(
            UpdateClients(clients),
          ),
        );
  }

  Stream<ClientsState> _mapUpdateCategoriesToState(UpdateClients event) async* {
    yield ClientsLoaded(clients: event.clients);
  }
}
