import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text('Login',
          style: GoogleFonts.jost(
              color: const Color(0xFF00588A),
              fontSize: 40.0,
              fontWeight: FontWeight.w600)),
    );
  }
}
