part of 'repairs_bloc.dart';

abstract class RepairsState extends Equatable {
  const RepairsState();

  @override
  List<Object> get props => [];
}

class RepairsLoading extends RepairsState {}

class RepairsLoaded extends RepairsState {
  final List<RepairModel> repairs;
  const RepairsLoaded(
      {this.repairs =
          const <RepairModel>[]}); // pass to costructor an empty lyst
  @override
  List<Object> get props => [repairs];
}
