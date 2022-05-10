import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int? _maxLine;
  final TextEditingController _controller;
  // final String? _errorText;
  final String _txtLable;
  //final String initialValue;
  final Function(String)? onChanged;
  final Function(bool)? onFocusChanged;

  const CustomTextFormField({
    Key? key,
    int? maxline,
    required TextEditingController controller,
    required String txtLable,
    // required this.initialValue,
    required this.onChanged,
    this.onFocusChanged,
    //required errorText,
  })  : _controller = controller,
        _txtLable = txtLable,
        _maxLine = maxline,
        // _errorText = errorText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      //initialValue: initialValue,
      onChanged: onChanged,
      onEditingComplete: () {},

      //keyboardType: TextInputType.name,
      decoration: InputDecoration(
          //   errorText: _errorText,
          border: const OutlineInputBorder(),
          label: Text(_txtLable)),
      maxLines: _maxLine,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$_txtLable non puo\' essere  ';
        }
        return null;
      },
    );
  }
}
