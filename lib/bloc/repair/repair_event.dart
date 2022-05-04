part of 'repair_bloc.dart';

abstract class RepairEvent extends Equatable {
  const RepairEvent();

  @override
  List<Object> get props => [];
}

class LoadRepairs extends RepairEvent {
  final List<RepairModel> repairs;
  const LoadRepairs({
    this.repairs = const <RepairModel>[],
  });

  @override
  List<Object> get props => [repairs];
}

class UpdateRepairs extends RepairEvent {
  final List<RepairModel> repairs;

  const UpdateRepairs(this.repairs);
  @override
  List<Object> get props => [repairs];
}
