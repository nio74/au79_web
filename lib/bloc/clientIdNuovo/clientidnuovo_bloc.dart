import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientidnuovo_event.dart';
part 'clientidnuovo_state.dart';

class ClientidnuovoBloc extends Bloc<ClientidnuovoEvent, ClientidnuovoState> {
  final ClientRepository _clientRepository;
  ClientidnuovoBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientIdLoading()) {
    on<LoadIdExtEvent>(_onLoadId);
  }

  Future<void> _onLoadId(
      LoadIdExtEvent event, Emitter<ClientidnuovoState> emit) async {
    var courrentState = (await _clientRepository.readIdClient());
    emit(ClientIdExternalLoaded(courrentState));
  }
}
