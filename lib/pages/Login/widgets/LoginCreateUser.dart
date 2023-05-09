import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginCreateUser extends StatefulWidget {
  const LoginCreateUser({super.key});

  @override
  State<LoginCreateUser> createState() => _LoginCreateUserState();
}

class _LoginCreateUserState extends State<LoginCreateUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-user');
        },
        child: Text('Criar conta', style: GoogleFonts.jost(fontWeight: FontWeight.w600, color: const Color(0xFF00588A), fontSize: 16))),
    );
  }
}