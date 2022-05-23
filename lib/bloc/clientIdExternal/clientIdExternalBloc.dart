import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientIdExternal_event.dart';
part 'clientIdExternal_state.dart';

class ClientIdExternalBloc
    extends Bloc<ClientIdExternalEvent, ClientIdExternalState> {
  final ClientRepository _clientRepository;
  ClientIdExternalBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientIdLoading()) {
    on<LoadIdExtEvent>(_onLoadId);
  }

  Future<void> _onLoadId(
      LoadIdExtEvent event, Emitter<ClientIdExternalState> emit) async {
    var courrentState = (await _clientRepository.readIdClient());
    emit(ClientIdExternalLoaded(courrentState));
  }
}
