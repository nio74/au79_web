part of 'repairs_bloc.dart';

abstract class RepairsEvent extends Equatable {
  const RepairsEvent();

  @override
  List<Object> get props => [];
}

class Loadrepairs extends RepairsEvent {
  final List<RepairModel> repairs;

  const Loadrepairs({this.repairs = const <RepairModel>[]});
  @override
  List<Object> get props => [repairs];
}

class AddRepair extends RepairsEvent {
  final RepairModel repair;
  const AddRepair({
    required this.repair,
  });
  @override
  List<Object> get props => [repair];
}

class UpdateRepair extends RepairsEvent {
  final RepairModel repair;
  const UpdateRepair({
    required this.repair,
  });
  @override
  List<Object> get props => [repair];
}

class DeleteRepair extends RepairsEvent {
  final RepairModel repair;
  const DeleteRepair({
    required this.repair,
  });
  @override
  List<Object> get props => [repair];
}
