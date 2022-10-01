import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int? _maxLine;
  final bool? _enable;
  final TextEditingController? _controller;
  final String? _initValue;
  // final String? _errorText;
  final String _txtLable;
  //final String initialValue;
  final Function(String)? onChanged;
  final Function(bool)? onFocusChanged;

  const CustomTextFormField({
    Key? key,
    int? maxline,
    String? initvalue,
    bool? enable,
    TextEditingController? controller,
    required String txtLable,
    // required this.initialValue,
    this.onChanged,
    this.onFocusChanged,
    //required errorText,
  })  : _controller = controller,
        _txtLable = txtLable,
        _enable = enable,
        _maxLine = maxline,
        _initValue = initvalue,
        // _errorText = errorText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: _enable,
      controller: _controller,
      initialValue: _initValue,
      onChanged: onChanged,
      onEditingComplete: () {},

      //keyboardType: TextInputType.name,
      decoration: InputDecoration(
          //   errorText: _errorText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))),
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
