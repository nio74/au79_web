import 'package:equatable/equatable.dart';

class RepairModel extends Equatable {
  final int code;
  final String nameClient;
  final String object;
  final String workTodo;

  const RepairModel({
    required this.code,
    required this.nameClient,
    required this.object,
    required this.workTodo,
  });

  @override
  List<Object?> get props => [code, nameClient, object, workTodo];

  RepairModel copyWith({
    int? code,
    String? nameClient,
    String? object,
    String? workTodo,
  }) {
    return RepairModel(
      code: code ?? this.code,
      nameClient: nameClient ?? this.nameClient,
      object: object ?? this.object,
      workTodo: workTodo ?? this.workTodo,
    );
  }
}

final repairList = [
  const RepairModel(
      code: 1,
      nameClient: 'Mike',
      object: 'ring',
      workTodo: 'workTodo saldare e portare a misura'),
  const RepairModel(
      code: 2, nameClient: 'Jhon', object: 'Bracialet', workTodo: 'workTodo'),
  const RepairModel(
      code: 2, nameClient: 'Pinco', object: 'ring', workTodo: 'workTodo'),
  const RepairModel(
      code: 4, nameClient: 'Mike', object: 'ring', workTodo: 'workTodo'),
  const RepairModel(
      code: 5, nameClient: 'Jhon', object: 'Bracialet', workTodo: 'workTodo'),
  const RepairModel(
      code: 6, nameClient: 'Pinco', object: 'ring', workTodo: 'workTodo'),
  const RepairModel(
      code: 7, nameClient: 'Mike', object: 'ring', workTodo: 'workTodo'),
];
