import 'package:au79_web/blocs/clients/clients_bloc.dart';
import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsModRepair extends StatefulWidget {
  InsModRepair({Key? key}) : super(key: key);

  @override
  State<InsModRepair> createState() => _InsModRepairState();
}

class _InsModRepairState extends State<InsModRepair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerCustomWidget(),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: Card(
                child: EasyAutocompleteWidget(),
              ),
            )
          ])
        ],
      ),
    );
  }
}

class EasyAutocompleteWidget extends StatelessWidget {
  const EasyAutocompleteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        if (state is ClientsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final clients = (state as ClientsLoaded).clients;
          return EasyAutocomplete(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 39, 60, 176),
                          style: BorderStyle.solid)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 39, 71, 176),
                          style: BorderStyle.solid))),
              suggestionBuilder: (data) {
                return Container(
                    margin: EdgeInsets.all(1),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 39, 87, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(data, style: TextStyle(color: Colors.white)));
              },
              suggestions: clients.map((e) => e.name).toList(),
              onChanged: (value) {
                print('onChange Value: $value');
              });
        }
        ;
      },
    );
  }
}
