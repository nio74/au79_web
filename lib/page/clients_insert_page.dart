import 'package:au79_web/bloc/client_index_ext/client_index_ext_bloc.dart';
import 'package:au79_web/model/client_model.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:au79_web/bloc/clients/clients_bloc.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/drawer_custom_widget.dart';

class ClientsInsertPage extends StatefulWidget {
  const ClientsInsertPage({Key? key}) : super(key: key);

  @override
  State<ClientsInsertPage> createState() => _ClientsInsertPageState();
}

class _ClientsInsertPageState extends State<ClientsInsertPage> {
  final _clientRepository = ClientRepository();
  final _formKey = GlobalKey<FormState>();
  int id = 0;
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _nameClientController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  bool _formValid = false;
  bool autocomleteValid = false;

  @override
  void initState() {
    //BlocProvider.of<ClientsBloc>(context).add(LoadIdEvent());
    //BlocProvider.of<ClientidnuovoBloc>(context).add(LoadIdExtEvent());

    super.initState();
  }

  @override
  void dispose() {
    _nameClientController.dispose();
    _addressController.dispose();
    _idController.dispose();

    super.dispose();
  }

  ClientModel client = ClientModel(id: 0, nameClient: '', address: '');

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
                      BlocListener<ClientsBloc, ClientsState>(
                        listener: (context, state) {
                          if (state is ClientBlocStateIndexExtLoaded) {
                            id = state.idNuovo;
                            _idController.text = id.toString();
                          }
                        },
                        child: CustomTextFormField(
                          enable: false,
                          txtLable: 'codice',
                          controller: _idController,
                        ),
                      ), //initvalue: id,

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
                                  client = client.copyWith(id: id);
                                  BlocProvider.of<ClientsBloc>(context).add(
                                      ClientBlocEventAddClients(
                                          clients: client));

                                  _clientRepository.save_id_external(id);

                                  _idController.text = (id + 1).toString();
                                  _addressController.text = '';
                                  _nameClientController.text = '';
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
