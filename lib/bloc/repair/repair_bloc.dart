import 'dart:async';
import 'package:au79_web/model/repair_model.dart';
import 'package:au79_web/repository/repair_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repair_event.dart';
part 'repair_state.dart';

class RepairBloc extends Bloc<RepairEvent, RepairState> {
  final RepairRepository _repairRepository;
  StreamSubscription? _repairSubscription;

  RepairBloc({required RepairRepository repairRepository})
      : _repairRepository = repairRepository,
        super(RepairBlocStateLoading()) {
    on<RepairBlocEventInit>(_onLoadRepairs);
    on<UpdateRepairs>(_updateRepair);
    on<RepairBlocLoadIdEvent>(_onLoadId);
  }

  FutureOr<void> _onLoadRepairs(
      RepairBlocEventInit event, Emitter<RepairState> emit) {
    _repairSubscription?.cancel();
    _repairSubscription = _repairRepository.getAllRepairs().listen(
          (products) => add(
            UpdateRepairs(products),
          ),
        );
  }

  FutureOr<void> _updateRepair(UpdateRepairs event, Emitter<RepairState> emit) {
    if (state != RepairBlocStateLoading) {
      emit(RepairBlocStateLoaded(repairs: event.repairs));
    }
  }

  Future<void> _onLoadId(RepairEvent event, Emitter<RepairState> emit) async {
    var courrentState = (_repairRepository.readIdRepairId());
    emit(RepairBlocStateIndexExtLoaded(await courrentState));
  }
}
