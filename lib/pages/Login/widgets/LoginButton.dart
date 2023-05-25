// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/services/authentication.dart';
import 'package:vidaleve/services/authentication_service.dart';
import 'package:vidaleve/services/authentication_exceptions.dart';
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
  final _authService = Authentication();

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
          try {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();

              String email = widget.email.text.trim();
              String password = widget.password.text.trim();

              final response = await _authService.login(
                email: email,
                password: password,
              );

              // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
              final status = AuthenticationException.handleAuthException(
                  (response['code']));

              if (status == AuthStatus.successful) {
                ToastNotification.message(context,
                    message: 'Login efetuado com sucesso!');

                Navigator.pushNamed(context, '/home');
              } else {
                final error = AuthenticationException.generateMessage(status);
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
