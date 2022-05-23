part of 'clientIdExternalBloc.dart';

abstract class ClientIdExternalState extends Equatable {
  const ClientIdExternalState();

  @override
  List<Object> get props => [];
}

class ClientIdLoading extends ClientIdExternalState {}

class ClientIdExternalLoaded extends ClientIdExternalState {
  final String idNuovo;

  const ClientIdExternalLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
