import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/pages/ChangePassword/widgets/ChangePasswordValidation.dart';
import 'package:vidaleve/providers/auth_provider.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/services/authentication.dart';
import 'package:vidaleve/utils/response_handler.dart';
import 'package:vidaleve/widgets/FormButton/FormButton.dart';
import 'package:vidaleve/widgets/Input/Input.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final Authentication _authService = Authentication();
  String? email;

  dynamic validations = [
    {"label": "Mínimo de 6 caracteres", "validation": false},
    {"label": "Mínimo de 1 letra maiúscula", "validation": false},
    {"label": "Mínimo de 1 letra minúscula", "validation": false},
    {"label": "Mínimo de 1 número", "validation": false}
  ];

  final _formKey = GlobalKey<FormState>();

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

  void setIsLoading(bool isLoading) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setIsLoading(isLoading);
  }

  void loadEmail() {
    email = Provider.of<AuthProvider>(context).forgottenEmail;
  }

  @override
  Widget build(BuildContext context) {
    loadEmail();

    dynamic validateString(String input) {
      // Verifica se contém pelo menos uma letra maiúscula, uma letra minúscula e um número
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

      if (input != _password.text) {
        return 'As senhas não coincidem';
      }
    }

    validator(value) {
      return validateString(value);
    }

    onPressed(context) async {
      try {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          setIsLoading(true);

          final String password = _password.text.trim();

          final response = await _authService.changePassword(
            email: email as String,
            password: password,
          );
          final status =
              AuthenticationException.handleAuthException((response['code']));

          if (status == AuthStatus.successful) {
            setIsLoading(false);

            ToastNotification.message(
              message: 'Senha alterada com sucesso!',
            );

            Future.delayed(const Duration(milliseconds: 300), () {
              this.context.go('/auth');
            });
          } else {
            setIsLoading(false);

            final error = AuthenticationException.generateMessage(status);

            ToastNotification.message(
              message: error,
            );
          }
        }
      } on ResponseHandler catch (message) {
        ToastNotification.message(message: message.toString());
      } catch (e) {
        log(e.toString());
      }
    }

    onPressedCancel(context) {
      context.go('/auth');
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Input(
                placeholder: 'Nova senha',
                icon: const Icon(Icons.lock),
                controller: _password,
                minLength: 6,
                onChange: _onTextChanged,
                type: 'password',
                validator: validator,
              ),
            ),
            Input(
              placeholder: 'Confirme a senha',
              icon: const Icon(Icons.lock),
              controller: _confirmPassword,
              minLength: 6,
              type: 'password',
              validator: validator,
            ),
            ChangePasswordValidation(validations: validations),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormButton(
                formKey: _formKey,
                onPressed: onPressed,
                text: 'Alterar senha',
              ),
            ),
            FormButton(
              formKey: _formKey,
              text: 'Cancelar',
              onPressed: onPressedCancel,
              color: Colors.red,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
