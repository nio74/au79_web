part of 'clientidnuovo_bloc.dart';

abstract class ClientidnuovoEvent extends Equatable {
  const ClientidnuovoEvent();

  @override
  List<Object> get props => [];
}

class LoadId extends ClientidnuovoEvent {
  final String idNuovo;

  const LoadId(this.idNuovo);

  @override
  List<Object> get props => [idNuovo];
}
