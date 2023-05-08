import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForget extends StatefulWidget {
  const LoginForget({super.key});

  @override
  State<LoginForget> createState() => _LoginForgetState();
}

class _LoginForgetState extends State<LoginForget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        child: Align(
          alignment: Alignment.centerRight,
          child: Text('Forgot Password',
              style: GoogleFonts.jost(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: const Color(0xFF00588A))),
        ));
  }
}
