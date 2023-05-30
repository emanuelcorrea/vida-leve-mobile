// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/services/authentication.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/utils/response_handler.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final _authService = Authentication();

  setIsLoading(bool isLoading) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setIsLoading(isLoading);
  }

  setUser(String user) {
    Provider.of<SettingsProvider>(context, listen: false).setUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 5.0),
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
            ),
          ),
        ),
        onPressed: () async {
          try {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              setIsLoading(true);

              String email = widget.email.text.trim();
              String password = widget.password.text.trim();

              final response = await _authService.login(
                email: email,
                password: password,
              );
              final status = AuthenticationException.handleAuthException(
                (response['code']),
              );
              if (status == AuthStatus.successful) {
                setIsLoading(false);

                String user = jsonEncode(response['data']);
                setUser(user);

                Future.delayed(const Duration(milliseconds: 400), () {
                  context.go('/home');
                });

                ToastNotification.message(
                  message: 'Login efetuado com sucesso!',
                );
              } else {
                setIsLoading(false);

                final error = AuthenticationException.generateMessage(status);

                ToastNotification.message(message: error);
              }
            }
          } on ResponseHandler catch (message) {
            ToastNotification.message(message: message.toString());
          } catch (e) {
            setIsLoading(false);
            log(e.toString());
          }
        },
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Entrar',
              style: GoogleFonts.jost(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
