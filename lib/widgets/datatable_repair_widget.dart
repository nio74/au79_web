import 'package:au79_web/blocs/repairs/repairs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTableRepairWidget extends StatelessWidget {
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

    return BlocBuilder<RepairsBloc, RepairsState>(builder: (context, state) {
      if (state is RepairsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        final repairs = (state as RepairsLoaded).repairs;
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
