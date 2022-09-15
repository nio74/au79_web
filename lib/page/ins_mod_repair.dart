import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/bloc/repair/repair_bloc.dart';

import 'package:au79_web/model/repair_model.dart';

import 'package:au79_web/widgets/custom_text_form_field.dart';

import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsModRepair extends StatefulWidget {
  const InsModRepair({Key? key}) : super(key: key);

  @override
  State<InsModRepair> createState() => _InsModRepairState();
}

class _InsModRepairState extends State<InsModRepair> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _objectController = TextEditingController();
  final TextEditingController _workTodoController = TextEditingController();
  int id = 0;
  bool _formValid = false;
  bool autocomleteValid = false;
  @override
  void initState() {
    BlocProvider.of<RepairBloc>(context).add(RepairBlocLoadIdEvent());
    super.initState();
  }

  @override
  void dispose() {
    _clientController.dispose();
    _objectController.dispose();
    _workTodoController.dispose();
    super.dispose();
  }

  RepairModel repair =
      const RepairModel(code: 0, nameClient: '', object: '', workTodo: '');

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
                    _errorText();
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocListener<RepairBloc, RepairState>(
                          listener: (context, state) {
                            if (state is RepairBlocStateIndexExtLoaded) {
                              id = state.idNuovo;
                              _codeController.text = id.toString();
                            }
                          },
                          child: CustomTextFormField(
                            enable: false,
                            controller: _codeController,
                            txtLable: 'Codice',
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFieldAutocomplete(),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          controller: _objectController,
                          txtLable: 'Oggetti',
                          // initialValue: '',
                          onChanged: (value) {
                            repair = repair.copyWith(object: value);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          // errorText: _errorText,
                          controller: _workTodoController,
                          txtLable: 'Lavorazioni d aeseguire',
                          //initialValue: '',
                          onChanged: (value) {
                            repair = repair.copyWith(workTodo: value);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: _formValid ? () {} : null,
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

  customTextFieldAutocomplete() {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        if (state is ClientBlocStatesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final clients = (state as ClientsBlocStateLoaded).clients;
          return EasyAutocomplete(
              controller: _clientController,
              //initialValue: '',
              decoration: InputDecoration(
                  errorText: _errorText(),
                  label: const Text('Cliente'),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
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
                if (value.length < 3) {
                  print('devi inserire almeno tre caratteri');
                }
                if (value.length > 3 ||
                    clients.map((e) => e.nameClient).contains(value)) {
                  print('il valore  e presente nella lista');
                } else {
                  print('valore non e presente nella lista');
                }
                repair.copyWith(nameClient: value);
              });
        }
      },
    );
  }

  _errorText() {
    final text = _clientController.text;
    if (text.isEmpty) {
      _formValid = false;

      return 'Inserire il nome del Cliente';
    }
  }
}
