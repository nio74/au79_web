import 'package:au79_web/bloc/repair/repair_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTableRepairWidget extends StatelessWidget {
  Function? _bloc;
  DataTableRepairWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(
    BuildContext context,
  ) {
    //final blocRiparazioni = ListaRiparazioniBloc();

    return BlocBuilder<RepairBloc, RepairState>(builder: (context, state) {
      if (state is RepairLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        final repairs = (state as RepairLoaded).repairs;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
              columns: const [
                DataColumn(label: Text('code')),
                DataColumn(label: Text('Object')),
                DataColumn(label: Text('Work to do')),
              ],
              rows: repairs
                  .map<DataRow>((element) => DataRow(cells: [
                        DataCell(Text(element.code.toString())),
                        DataCell(Text(element.object)),
                        DataCell(Text(element.workTodo)),
                      ]))
                  .toList()),
        );
      }
    });
  }
}
