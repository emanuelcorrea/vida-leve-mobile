import 'package:flutter/material.dart';
import 'package:vidaleve/pages/Login/widgets/LoginButton.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForget.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Input(
              placeholder: 'E-mail',
              icon: const Icon(Icons.person),
              controller: email,
              type: 'email',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Input(
                placeholder: 'Senha',
                icon: const Icon(Icons.lock),
                controller: password,
                type: 'password',
                minLength: 6,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LoginForget(email: email),
            ),
            LoginButton(
              formKey: _formKey,
              email: email,
              password: password,
            )
          ],
        ),
      ),
    );
  }
}
