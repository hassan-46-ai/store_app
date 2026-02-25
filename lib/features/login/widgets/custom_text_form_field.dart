import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.Controller,
     required this .hinttxt,
     required this .value
  });

  final TextEditingController Controller;
final String hinttxt;
final String value;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter your password';
        } else if (value.length < 6) {
          return 'too short password';
        } else
          return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hinttxt,
      ),
    );
  }
}
