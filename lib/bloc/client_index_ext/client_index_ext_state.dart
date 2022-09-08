part of 'client_index_ext_bloc.dart';

abstract class ClientIndexExtBlocState extends Equatable {
  const ClientIndexExtBlocState();

  @override
  List<Object> get props => [];
}

class ClientIdLoading extends ClientIndexExtBlocState {}

class ClientIndexExtBlocStateLoaded extends ClientIndexExtBlocState {
  final int idNuovo;

  const ClientIndexExtBlocStateLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
