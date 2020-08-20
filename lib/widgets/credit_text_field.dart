import 'package:flutter/material.dart';

class CreditTextField extends StatelessWidget {
  const CreditTextField({
    Key key,
    @required this.onChanged,
    @required this.labelText,
    @required this.textInputType,
    this.onTap,
    this.maxLength,
    this.controller,
  }) : super(key: key);

  final Function(String val) onChanged;
  final String labelText;
  final TextInputType textInputType;
  final VoidCallback onTap;
  final int maxLength;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        helperStyle: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
      maxLength: maxLength,
      controller: controller,
    );
  }
}
