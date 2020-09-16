import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final ValueChanged<String> onSaved;
  final String Function(String value) validator;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final Icon icon;
  final TextEditingController controller;
  const InputTextField({
    Key key,
    this.onSaved,
    this.validator,
    @required this.labelText,
    this.hintText,
    this.keyboardType,
    this.icon,
    this.controller,
  })  : assert(labelText != null, "InputTextField"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            labelText: labelText, hintText: hintText, prefixIcon: icon),
      ),
    );
  }
}
