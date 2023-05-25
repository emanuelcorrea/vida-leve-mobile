// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/services/authentication_service.dart';
import 'package:vidaleve/services/authentication_exceptions.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class CreateUserButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;

  const CreateUserButton(
      {super.key,
      required this.formKey,
      required this.email,
      required this.password,
      required this.name});

  @override
  State<CreateUserButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<CreateUserButton> {
  final _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xFF00588A);
              }
              return const Color(0xFF00588A);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        onPressed: () async {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          try {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();

              String email = widget.email.text.trim();
              String password = widget.password.text.trim();
              String name = widget.name.text.trim();

              final status = await _authService.createAccount(
                  email: email, password: password, name: name);

              if (status == AuthStatus.successful) {
                ToastNotification.message(context,
                    message: 'Usuário criado com sucesso!');

                Navigator.pushNamed(context, '/');
              } else {
                final error = AuthenticationException.generateMessage(status);
                ToastNotification.message(
                  context,
                  message: error,
                );
              }
            }
          } on FirebaseAuthException catch (e) {
            print(e);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Criar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
