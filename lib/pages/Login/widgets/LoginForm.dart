import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/Login/widgets/LoginButton.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForget.dart';
import 'package:vidaleve/pages/Login/widgets/LoginInput.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
      child: Form(
        child: Column(
          children: [
            const LoginInput(
              placeholder: 'ID',
              icon: Icon(Icons.person),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: LoginInput(
                placeholder: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            const LoginForget(),
            LoginButton(formKey: _formKey)
          ],
        ),
      ),
    );
  }
}
