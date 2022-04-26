import 'package:au79_web/model/repair_model.dart';
import 'package:bloc/bloc.dart';

class ListRepairBloc extends Bloc<ListRepairBlocEvent, ListRepairBlocState> {
  ListRepairBloc() : super(ListaRiparazioniBlocStateLoading()) {
    on<ListRepairBlocEventInit>((event, emit) async {
      emit(ListaRiparazioniBlocStateLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(ListRepairBlocStateLoaded(repairList));
    });
  }
}

abstract class ListRepairBlocEvent {}

class ListRepairBlocEventInit extends ListRepairBlocEvent {}

abstract class ListRepairBlocState {}

class ListaRiparazioniBlocStateLoading extends ListRepairBlocState {}

class ListRepairBlocStateLoaded extends ListRepairBlocState {
  List<RepairModel> repairs;
  ListRepairBlocStateLoaded(this.repairs);
}
