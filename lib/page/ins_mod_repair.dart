import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/widgets/custom_text_form_field.dart';

import 'package:au79_web/widgets/drawer_custom_widget.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class InsModRepair extends StatefulWidget {
  const InsModRepair({Key? key}) : super(key: key);

  @override
  State<InsModRepair> createState() => _InsModRepairState();
}

class _InsModRepairState extends State<InsModRepair> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _objectController = TextEditingController();
  final TextEditingController _workTodoController = TextEditingController();

  bool _formValid = false;
  bool autocomleteValid = false;

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
                      _formValid = isValid;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),

                      //CustomTextFormField(controller: _clientController, txtLable: '',),
                      EasyAutocompleteWidget(
                        txtLable: 'Inserire Cliente',
                        controller: _clientController,
                        errorText: _errorText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          errorText: _errorText,
                          controller: _objectController,
                          txtLable: 'Oggetti'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          maxline: 5,
                          errorText: _errorText,
                          controller: _workTodoController,
                          txtLable: 'Lavorazioni d aeseguire'),
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

  get _errorText {
    final textClient = _clientController.value.text;
    final textObject = _objectController.value.text;
    final textworkToDo = _workTodoController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (textClient.isEmpty && textObject.isEmpty && textworkToDo.isEmpty) {
      return 'Il campo non puo essere vuto';
    }
    /* if (textObject.isEmpty) {
      return 'Il campo non puo essere vuto';
      
    }
    if (textworkToDo.isEmpty) {
      return 'Il campo non puo essere vuto';
    }  */
    else {
      setState(() {
        _formValid = true;
      });
    }
  }
}

class EasyAutocompleteWidget extends StatelessWidget {
  EasyAutocompleteWidget({
    required TextEditingController controller,
    required errorText,
    required String txtLable,
    Key? key,
  })  : _controller = controller,
        _txtLable = txtLable,
        _errorText = errorText,
        super(key: key);

  final TextEditingController _controller;
  final String? _errorText;
  final String _txtLable;

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
                  errorText: _errorText,
                  label: Text(_txtLable),
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
