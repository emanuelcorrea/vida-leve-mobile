import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotBack.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotButton.dart';
import 'package:vidaleve/pages/Login/widgets/LoginInput.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            children: [
              LoginInput(
                placeholder: 'E-mail',
                icon: const Icon(Icons.person),
                controller: email,
              ),
              ForgotButton(formKey: _formKey, email: email),
              ForgotBack()
            ],
          ),
        ));
  }
}
