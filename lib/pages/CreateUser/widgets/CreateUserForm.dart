import 'package:flutter/material.dart';
import 'package:vidaleve/pages/ChangePassword/widgets/ChangePasswordValidation.dart';
import 'package:vidaleve/pages/CreateUser/widgets/CreateUserButton.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotBack.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  dynamic validations = [
    {"label": "Mínimo de 6 caracteres", "validation": false},
    {"label": "Mínimo de 1 letra maiúscula", "validation": false},
    {"label": "Mínimo de 1 letra minúscula", "validation": false},
    {"label": "Mínimo de 1 número", "validation": false}
  ];

  void _onTextChanged(text) {
    setState(() {
      validations = [
        {
          "label": "Mínimo de 6 caracteres",
          "validation": text.length >= 6,
        },
        {
          "label": "Mínimo de 1 letra maiúscula",
          "validation": text.contains(RegExp(r'[A-Z]'))
        },
        {
          "label": "Mínimo de 1 letra minúscula",
          "validation": text.contains(RegExp(r'[a-z]'))
        },
        {
          "label": "Mínimo de 1 número",
          "validation": text.contains(RegExp(r'[0-9]'))
        }
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic validateString(String input) {
      bool hasUppercase = RegExp(r'[A-Z]').hasMatch(input);
      bool hasLowercase = RegExp(r'[a-z]').hasMatch(input);
      bool hasNumber = RegExp(r'[0-9]').hasMatch(input);

      if (!hasUppercase) {
        return 'Digite pelo menos 1 letra maiúscula';
      }

      if (!hasLowercase) {
        return 'Digite pelo menos 1 letra minúscula';
      }

      if (!hasNumber) {
        return 'Digite pelo menos 1 número';
      }
    }

    validator(value) {
      return validateString(value);
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
        child: Column(
          children: [
            Input(
              placeholder: 'Nome',
              icon: const Icon(Icons.person),
              controller: _name,
              minLength: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Input(
                placeholder: 'E-mail',
                icon: const Icon(Icons.mail),
                controller: _email,
                type: 'email',
              ),
            ),
            Input(
              placeholder: 'Senha',
              icon: const Icon(Icons.lock),
              controller: _password,
              minLength: 6,
              onChange: _onTextChanged,
              type: 'password',
              validator: validator,
            ),
            ChangePasswordValidation(validations: validations),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CreateUserButton(
                formKey: _formKey,
                email: _email,
                password: _password,
                name: _name,
              ),
            ),
            const ForgotBack()
          ],
        ),
      ),
    );
  }
}
