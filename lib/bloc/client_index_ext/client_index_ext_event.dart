part of 'client_index_ext_bloc.dart';

abstract class ClientIdExternalEvent extends Equatable {
  const ClientIdExternalEvent();

  @override
  List<Object> get props => [];
}

class LoadIdExtEvent extends ClientIdExternalEvent {}
