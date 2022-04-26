import 'package:au79_web/blocs/clients/clients_bloc.dart';
import 'package:au79_web/blocs/repairs/repairs_bloc.dart';
import 'package:au79_web/model/client_model.dart';
import 'package:au79_web/model/repair_model.dart';
import 'package:au79_web/widgets/datatable_repair_widget.dart';
import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RiparazionePage extends StatefulWidget {
  RiparazionePage({Key? key}) : super(key: key);

  @override
  State<RiparazionePage> createState() => _PageRiparazioniState();
}

class _PageRiparazioniState extends State<RiparazionePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<RepairsBloc>(context).add(Loadrepairs(repairs: repairList));
    BlocProvider.of<ClientsBloc>(context)
        .add(LoadClients(clients: clientsList));
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['pinco', 'pallino', 'giordano'];
    return Scaffold(
      drawer: const DrawerCustom(),
      appBar: AppBar(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('INSERT')),
              ),
            ),
          ],
        ),
        Row(children: [
          Expanded(
            child: Form(
              child: Column(
                children: [
                  TextField(),
                  TextField(),
                  TextField(),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: DataTableRepairWidget(context: context)),
        ])
      ]),
    );
  }
}
