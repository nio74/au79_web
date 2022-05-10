import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/model/client_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/drawer_custom_widget.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _nameClientController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  bool _formValid = false;

  bool autocomleteValid = false;

  @override
  void dispose() {
    _nameClientController.dispose();
    _addressController.dispose();
    _idController.dispose();
    super.dispose();
  }

  ClientModel client = ClientModel(id: '', nameClient: '', address: '');

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
                      _formValid = isValid;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: _idController,
                          txtLable: 'Codice',
                          //initialValue: '',
                          onChanged: (value) {
                            client = client.copyWith(id: value);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          controller: _nameClientController,
                          txtLable: 'Nome Cliente',
                          // initialValue: '',
                          onChanged: (value) {
                            client = client.copyWith(nameClient: value);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          // errorText: _errorText,
                          controller: _addressController,
                          txtLable: 'Indirizzo',
                          //initialValue: '',
                          onChanged: (value) {
                            client = client.copyWith(address: value);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: _formValid
                              ? () {
                                  BlocProvider.of<ClientsBloc>(context)
                                      .add(AddClients(clients: client));
                                }
                              : null,
                          child: const Text('SALVA')),
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
