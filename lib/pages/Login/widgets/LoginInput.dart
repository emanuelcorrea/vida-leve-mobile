import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginInput extends StatefulWidget {
  final String placeholder;
  final Icon icon;
  final TextEditingController controller;

  const LoginInput(
      {super.key,
      required this.placeholder,
      required this.icon,
      required this.controller});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
