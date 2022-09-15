part of 'repair_bloc.dart';

abstract class RepairState extends Equatable {
  const RepairState();

  @override
  List<Object> get props => [];
}

class RepairBlocStateLoading extends RepairState {}

class RepairBlocStateLoaded extends RepairState {
  final List<RepairModel> repairs;
  const RepairBlocStateLoaded(
      {this.repairs =
          const <RepairModel>[]}); // pass to costructor an empty lyst
  @override
  List<Object> get props => [repairs];
}

class RepairBlocStateIndexExtLoaded extends RepairState {
  final int idNuovo;

  const RepairBlocStateIndexExtLoaded(this.idNuovo);
  @override
  List<Object> get props => [idNuovo];
}
