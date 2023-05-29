// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/providers/auth_provider.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/services/authentication.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class ForgotButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;

  const ForgotButton({super.key, required this.formKey, required this.email});

  @override
  State<ForgotButton> createState() => _ForgotButtonState();
}

class _ForgotButtonState extends State<ForgotButton> {
  final _authService = Authentication();

  void generateToken() {
    Provider.of<AuthProvider>(context, listen: false).generateToken();
  }

  String getCode() {
    return Provider.of<AuthProvider>(context, listen: false).token;
  }

  void setLoading(bool isLoading) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setIsLoading(isLoading);
  }

  setEmail(String email) {
    Provider.of<AuthProvider>(context, listen: false)
        .changeForgottenEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
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
              setLoading(true);
              widget.formKey.currentState!.save();

              FocusScope.of(context).unfocus();

              generateToken();

              final String code = getCode();
              String email = widget.email.text.trim();

              final response = await _authService.resetPassword(
                email: email,
                code: code,
              );

              final status = AuthenticationException.handleAuthException(
                (response['code']),
              );

              if (status == AuthStatus.successful) {
                setLoading(false);
                setEmail(email);

                ToastNotification.message(
                  message: 'E-mail de recuperação enviado!',
                );

                Future.delayed(const Duration(milliseconds: 600), () {
                  context.go('/auth/forgot-password/confirmation');
                });
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
          child: Text(
            'Enviar',
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
