part of 'clientidnuovo_bloc.dart';

abstract class ClientidnuovoState extends Equatable {
  const ClientidnuovoState();

  @override
  List<Object> get props => [];
}

class ClientidLoading extends ClientidnuovoState {}

class ClientIdLoaded extends ClientidnuovoState {
  final String idNuovo;

  const ClientIdLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
