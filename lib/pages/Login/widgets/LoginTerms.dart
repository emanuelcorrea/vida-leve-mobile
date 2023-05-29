import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTerms extends StatelessWidget {
  const LoginTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text('Termos de uso e políticas de privacidade',
            style: GoogleFonts.jost(
                fontWeight: FontWeight.w600, color: const Color(0xFF4673FF))),
      ),
    );
  }
}
