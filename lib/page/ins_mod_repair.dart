import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/widgets/custom_text_form_field.dart';

import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class InsModRepair extends StatefulWidget {
  InsModRepair({Key? key}) : super(key: key);

  @override
  State<InsModRepair> createState() => _InsModRepairState();
}

class _InsModRepairState extends State<InsModRepair> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _objectController = TextEditingController();
  final TextEditingController _workTodoController = TextEditingController();

  bool formValide = false;

  @override
  void dispose() {
    _objectController.dispose();
    _workTodoController.dispose();
    super.dispose();
  }

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
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    setState(() {
                      formValide = isValid;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      /* EasyAutocompleteWidget(
                        controller: _clientController,
                      ), */
                      CustoSimpleTextFieldAutocomplete(),
                      const SizedBox(
                        height: 10,
                      ),
                      //CustomTextFormField(controller: _clientController, txtLable: '',),
                      CustomTextFormField(
                          maxline: 5,
                          controller: _objectController,
                          txtLable: 'Oggetti'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          controller: _workTodoController,
                          txtLable: 'Lavorazioni d aeseguire')
                    ],
                  ),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}

class CustoSimpleTextFieldAutocomplete extends StatelessWidget {
  const CustoSimpleTextFieldAutocomplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(builder: (context, state) {
      return BlocBuilder<ClientsBloc, ClientsState>(builder: (context, state) {
        if (state is ClientsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final clients = (state as ClientsLoaded).clients;
          return SimpleAutocompleteFormField(
            itemBuilder: (context, _) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(clients.map((e) => e.nameClient).toList().toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
            ),
            onSearch: (search) async => clients
                .where((clients) => clients.nameClient
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            itemFromString: (string) {
              final matches = clients.where((clients) =>
                  clients.nameClient
                      .toLowerCase()
                      .contains(clients.toLowerCase()) ==
                  string.toLowerCase());
              return matches.isEmpty ? null : matches.first;
            },
          );
        }
      });
    });
  }
}

class EasyAutocompleteWidget extends StatelessWidget {
  const EasyAutocompleteWidget({
    required TextEditingController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

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
              controller: _controller,
              decoration: InputDecoration(
                  label: const Text('Inserire nome Cliente'),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid))),
              suggestionBuilder: (data) {
                return Container(
                    margin: const EdgeInsets.all(1),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(data,
                        style: Theme.of(context).textTheme.headline3));
              },
              suggestions: clients.map((e) => e.nameClient).toList(),
              onChanged: (value) {
                print('onChange Value: $value');
              });
        }
      },
    );
  }
}
