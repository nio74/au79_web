import 'dart:async';

import 'package:au79_web/repository/client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientidnuovo_event.dart';
part 'clientidnuovo_state.dart';

class ClientidnuovoBloc extends Bloc<ClientidnuovoEvent, ClientidnuovoState> {
  final ClientRepository _clientRepository;
  ClientidnuovoBloc({required ClientRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientidLoading()) {
    on<LoadId>(_onLoadId);
  }

  FutureOr<void> _onLoadId(LoadId event, Emitter<ClientidnuovoState> emit) {
    if (state is ClientidLoading) {
      emit(ClientIdLoaded('18'));
    }
  }
}
