import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/providers/auth_provider.dart';

class LoginForget extends StatefulWidget {
  final TextEditingController email;

  const LoginForget({super.key, required this.email});

  @override
  State<LoginForget> createState() => _LoginForgetState();
}

class _LoginForgetState extends State<LoginForget> {
  setEmail(String email) {
    Provider.of<AuthProvider>(context, listen: false)
        .changeForgottenEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setEmail(widget.email.value.text);
        context.go('/auth/forgot-password');
      },
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(const Size(200.0, 50.0)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Esqueci minha senha',
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: const Color(0xFF00588A),
          ),
        ),
      ),
    );
  }
}
