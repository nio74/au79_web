import 'package:au79_web/model/client_model.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:au79_web/widgets/custom_text_form_field.dart';
import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:flutter/material.dart';

class ClientInsertPage2 extends StatefulWidget {
  const ClientInsertPage2({Key? key}) : super(key: key);

  @override
  State<ClientInsertPage2> createState() => _ClientInsertPage2State();
}

class _ClientInsertPage2State extends State<ClientInsertPage2> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameClientController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _clientRepository = ClientRepository();
  final _formKey = GlobalKey<FormState>();
  bool _formValid = false;
  String id = '';

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
                      CustomTextFormField(
                        enable: false,
                        txtLable: 'codice',
                        controller: _addressController,
                      ),
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
                                  client = client.copyWith(
                                      id: int.parse(_idController.text));
                                  List<ClientModel> passalista = [];
                                  passalista.add(client);

                                  _clientRepository.addClient2(passalista);
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
