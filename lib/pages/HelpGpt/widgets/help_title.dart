import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpTitle extends StatefulWidget {
  const HelpTitle({super.key});

  @override
  State<HelpTitle> createState() => _HelpTitleState();
}

class _HelpTitleState extends State<HelpTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Text(
        'Precisamos saber um pouco mais sobre você, por favor, responda as questões abaixo.',
        style: GoogleFonts.jost(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
