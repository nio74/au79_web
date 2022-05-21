import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/bloc/repair/repair_bloc.dart';
import 'package:au79_web/widgets/datatable_repair_widget.dart';
import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/client_repository.dart';

class RiparazionePage extends StatefulWidget {
  RiparazionePage({Key? key}) : super(key: key);

  @override
  State<RiparazionePage> createState() => _PageRiparazioniState();
}

class _PageRiparazioniState extends State<RiparazionePage> {
  @override
  void initState() {
    // BlocProvider.of<RepairBloc>(context).add(LoadRepairs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerCustomWidget(),
      appBar: AppBar(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              //flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ins_mod_repair');
                      /*  ClientRepository rep = ClientRepository();
                      rep.createClient(); */
                    },
                    child: const Text('INSERT')),
              ),
            ),
          ],
        ),
        Row(children: [
          Expanded(
              flex: 2,
              child: Card(child: DataTableRepairWidget(context: context))),
          Expanded(
            child: Card(
              child: Form(
                child: Column(
                  children: [
                    //EasyAutocomplete(),
                    // EasyAutocomplete(),
                    BlocBuilder<ClientsBloc, ClientsState>(
                        builder: (context, state) {
                      if (state is ClientsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final clients = (state as ClientsLoaded).clients;
                        return EasyAutocomplete(
                          suggestions:
                              clients.map((e) => e.nameClient).toList(),
                          onChanged: (value) {
                            print('onChange Value: $value');
                          },
                        );
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ])
      ]),
    );
  }
}
