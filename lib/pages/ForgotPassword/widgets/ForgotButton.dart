// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/services/authentication_service.dart';
import 'package:vidaleve/services/authentication_exceptions.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class ForgotButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;

  const ForgotButton({super.key, required this.formKey, required this.email});

  @override
  State<ForgotButton> createState() => _ForgotButtonState();
}

class _ForgotButtonState extends State<ForgotButton> {
  final _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 25),
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

              final status = await _authService.resetPassword(email: email);

              if (status == AuthStatus.successful) {
                ToastNotification.message(
                  context,
                  message: 'E-mail de recuperação enviado!',
                );

                Navigator.pushNamed(context, '/');
              } else {
                final error = AuthenticationException.generateMessage(status);

                ToastNotification.showErrorSnackBar(
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
          child: Text('Enviar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
