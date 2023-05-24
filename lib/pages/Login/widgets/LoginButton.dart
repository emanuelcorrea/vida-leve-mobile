// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/utils/authentication_service.dart';
import 'package:vidaleve/utils/firebase_exceptions.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  const LoginButton(
      {super.key,
      required this.formKey,
      required this.email,
      required this.password});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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

              final status = await _authService.login(
                email: email,
                password: password,
              );

              if (status == AuthStatus.successful) {
                ToastNotification.message(context,
                    message: 'Login efetuado com sucesso!');

                Navigator.pushNamed(context, '/layout');
              } else {
                final error = AuthExceptionHandler.generateMessage(status);
                ToastNotification.message(
                  context,
                  message: error,
                );
              }
            }
          } catch (e) {
            print(e);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Entrar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
