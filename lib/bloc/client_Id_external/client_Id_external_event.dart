part of 'client_Id_externalBloc.dart';

abstract class ClientIdExternalEvent extends Equatable {
  const ClientIdExternalEvent();

  @override
  List<Object> get props => [];
}

class LoadIdExtEvent extends ClientIdExternalEvent {}
