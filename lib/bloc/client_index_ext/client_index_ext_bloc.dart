import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_index_ext_event.dart';
part 'client_index_ext_state.dart';

class ClientIndexExtBloc
    extends Bloc<ClientIdExternalEvent, ClientIndexExtBlocState> {
  final ClientRepository _clientRepository;

  ClientIndexExtBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientIdLoading()) {
    on<ClientIndexExtBlocEventInit>(_onLoadId);
  }

  Future<void> _onLoadId(ClientIndexExtBlocEventInit event,
      Emitter<ClientIndexExtBlocState> emit) async {
    var courrentState = (await _clientRepository.readIdClient());
    emit(ClientIndexExtBlocStateLoaded(courrentState));
  }
}
