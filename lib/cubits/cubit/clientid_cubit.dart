import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientid_state.dart';

class ClientidCubit extends Cubit<ClientidState> {
  ClientidCubit() : super(ClientidLoading());
}
