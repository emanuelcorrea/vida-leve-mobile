import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final String type;
  final Icon icon;
  final TextEditingController controller;

  const Input(
      {super.key,
      required this.placeholder,
      required this.icon,
      required this.controller,
      this.type = 'text'});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.type == 'password' ? true : false,
      enableSuggestions: widget.type == 'password' ? true : false,
      autocorrect: widget.type == 'password' ? true : false,
      decoration: InputDecoration(
        icon: widget.icon,
        hintText: widget.placeholder,
      ),
      validator: (String? value) {
        try {
          if (value == null || value.isEmpty) {
            return 'Campo inválido!';
          }
          return null;
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
