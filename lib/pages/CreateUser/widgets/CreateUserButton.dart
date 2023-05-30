// ignore_for_file: use_build_context_synchronously

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
  final _authService = Authentication();

  void setIsLoading(bool isLoading) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setIsLoading(isLoading);
  }

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
              setIsLoading(true);

              String email = widget.email.text.trim();
              String password = widget.password.text.trim();
              String name = widget.name.text.trim();

              final response = await _authService.createAccount(
                  email: email, password: password, name: name);

              final status = AuthenticationException.handleAuthException(
                  (response['code']));

              setIsLoading(false);

              if (status == AuthStatus.successful) {
                ToastNotification.message(
                    message: 'Usuário criado com sucesso!');

                Future.delayed(const Duration(milliseconds: 300), () {
                  context.go('/auth');
                });
              } else {
                final error = AuthenticationException.generateMessage(status);

                ToastNotification.message(
                  message: error,
                );
              }
            }
          } on ResponseHandler catch (message) {
            ToastNotification.message(message: message.toString());
          } on Exception catch (e) {
            setIsLoading(false);
            log(e.toString());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Criar',
            style: GoogleFonts.jost(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
