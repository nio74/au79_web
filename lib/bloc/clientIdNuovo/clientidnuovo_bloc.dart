import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientidnuovo_event.dart';
part 'clientidnuovo_state.dart';

class ClientidnuovoBloc extends Bloc<ClientidnuovoEvent, ClientidnuovoState> {
  final ClientRepository _clientRepository;
  ClientidnuovoBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientIdLoaded('5')) {
    on<LoadIdEvent>(_onLoadId);
    ;
  }

  Future<void> _onLoadId(
      LoadIdEvent event, Emitter<ClientidnuovoState> emit) async {
    final courrentState = (state as ClientIdLoaded).idNuovo;
    emit(ClientIdLoaded('nuovo'));
  }
}
