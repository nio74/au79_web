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
        super(RepairLoading()) {
    on<LoadRepairs>(_onLoadRepairs);
    on<UpdateRepairs>(_updateRepair);
  }

  FutureOr<void> _onLoadRepairs(LoadRepairs event, Emitter<RepairState> emit) {
    _repairSubscription?.cancel();
    _repairSubscription = _repairRepository.getAllRepairs().listen(
          (products) => add(
            UpdateRepairs(products),
          ),
        );
  }

  FutureOr<void> _updateRepair(UpdateRepairs event, Emitter<RepairState> emit) {
    emit(RepairLoaded(repairs: event.repairs));
  }
}
