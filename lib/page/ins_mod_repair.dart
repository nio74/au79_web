import 'package:au79_web/bloc/clients/clients_bloc.dart';

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

class CustoSimpleTextFieldAutocomplete extend StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context,state) {
        return SimpleAutocompleteFormField(
          itemBuilder: itemBuilder, onSearch: onSearch);
      }
    )
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
              }
              );
        }
      },
    );
  }
}
