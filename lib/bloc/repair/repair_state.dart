part of 'repair_bloc.dart';

abstract class RepairState extends Equatable {
  const RepairState();

  @override
  List<Object> get props => [];
}

class RepairLoading extends RepairState {}

class RepairLoaded extends RepairState {
  final List<RepairModel> repairs;
  const RepairLoaded(
      {this.repairs =
          const <RepairModel>[]}); // pass to costructor an empty lyst
  @override
  List<Object> get props => [repairs];
}
