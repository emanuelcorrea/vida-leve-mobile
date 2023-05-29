import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/ChangePassword/ChangePasswordPage.dart';
import 'package:vidaleve/providers/auth_provider.dart';
import 'package:vidaleve/widgets/FormButton/FormButton.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class ForgotPasswordConfirmForm extends StatefulWidget {
  const ForgotPasswordConfirmForm({super.key});

  @override
  State<ForgotPasswordConfirmForm> createState() =>
      _ForgotPasswordConfirmFormState();
}

class _ForgotPasswordConfirmFormState extends State<ForgotPasswordConfirmForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController confirmCode = TextEditingController();

  @override
  void dispose() {
    confirmCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code = context.watch<AuthProvider>().token;

    Route createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ChangePasswordPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }

    onPressed(context) async {
      try {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          FocusScope.of(context).unfocus();

          Navigator.of(context).push(createRoute());
        }
      } catch (e) {
        log(e.toString());
      }
    }

    validator(value) {
      if (value.toString() != code) return 'Código inválido';
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Input(
              placeholder: 'Código de confirmação',
              icon: const Icon(Icons.numbers),
              controller: confirmCode,
              minLength: 6,
              validator: validator,
            ),
            FormButton(
                formKey: _formKey, onPressed: onPressed, text: 'Confirmar')
          ],
        ),
      ),
    );
  }
}
