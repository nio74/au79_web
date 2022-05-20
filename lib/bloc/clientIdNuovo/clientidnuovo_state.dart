part of 'clientidnuovo_bloc.dart';

abstract class ClientidnuovoState extends Equatable {
  const ClientidnuovoState();

  @override
  List<Object> get props => [];
}

class ClientIdLoading extends ClientidnuovoState {}

class ClientIdExternalLoaded extends ClientidnuovoState {
  final String idNuovo;

  const ClientIdExternalLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
