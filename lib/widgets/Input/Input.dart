import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final String type;
  Icon? icon;
  final int minLength;
  final TextEditingController controller;
  final dynamic onChange;
  final validator;

  Input({
    super.key,
    required this.controller,
    required this.placeholder,
    this.icon,
    this.minLength = 0,
    this.type = 'text',
    this.validator,
    this.onChange,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.type == 'password',
      enableSuggestions: widget.type == 'password',
      autocorrect: widget.type == 'password',
      onChanged: (text) {
        if (widget.onChange != null) {
          widget.onChange(text);
        }
      },
      decoration: InputDecoration(
        icon: widget.icon,
        hintText: widget.placeholder,
      ),
      validator: (String? value) {
        try {
          if (value == null || value.isEmpty) {
            return 'Preencha esse campo!';
          }

          if (widget.type == 'email') {
            final emailRegExp = RegExp(
                r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
            if (!emailRegExp.hasMatch(value)) {
              return 'E-mail inválido!';
            }
          }

          if (widget.minLength != 0 && value.length < widget.minLength) {
            return 'Esse campo deve ter pelo menos ${widget.minLength} caracteres!';
          }

          if (widget.validator != null) {
            return widget.validator(value);
          }

          return null;
        } catch (e) {
          print(e);
        }
        return null;
      },
    );
  }
}
