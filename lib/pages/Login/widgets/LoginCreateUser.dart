import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginCreateUser extends StatefulWidget {
  const LoginCreateUser({super.key});

  @override
  State<LoginCreateUser> createState() => _LoginCreateUserState();
}

class _LoginCreateUserState extends State<LoginCreateUser> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go('/create-user'),
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(const Size(80, 50)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(80, 50)),
      ),
      child: Text(
        'Criar conta',
        style: GoogleFonts.jost(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00588A),
          fontSize: 16,
        ),
      ),
    );
  }
}
