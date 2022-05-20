part of 'clientidnuovo_bloc.dart';

abstract class ClientidnuovoEvent extends Equatable {
  const ClientidnuovoEvent();

  @override
  List<Object> get props => [];
}

class LoadIdExtEvent extends ClientidnuovoEvent {}
