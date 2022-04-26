import 'dart:async';

import 'package:au79_web/model/repair_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repairs_event.dart';
part 'repairs_state.dart';

class RepairsBloc extends Bloc<RepairsEvent, RepairsState> {
  RepairsBloc() : super(RepairsLoading()) {
    on<Loadrepairs>(_onloadRepairs);
    on<AddRepair>(_onAddRepairs);
    on<DeleteRepair>(_onDeleteRepairs);
    on<UpdateRepair>(_onUpdateRepairs);
  }

  FutureOr<void> _onloadRepairs(Loadrepairs event, Emitter<RepairsState> emit) {
    emit(RepairsLoaded(repairs: event.repairs));
  }

  FutureOr<void> _onAddRepairs(AddRepair event, Emitter<RepairsState> emit) {}

  FutureOr<void> _onDeleteRepairs(
      DeleteRepair event, Emitter<RepairsState> emit) {}

  FutureOr<void> _onUpdateRepairs(
      UpdateRepair event, Emitter<RepairsState> emit) {}
}
