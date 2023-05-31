import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnamneseHeader extends StatefulWidget {
  const AnamneseHeader({super.key});

  @override
  State<AnamneseHeader> createState() => _HeaderState();
}

class _HeaderState extends State<AnamneseHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 9,
      decoration: const BoxDecoration(color: Color(0xFF00588A), boxShadow: [
        BoxShadow(
          color: Color.fromARGB(148, 158, 158, 158),
          blurRadius: 3,
          offset: Offset(0, 8), // Shadow position
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 20),
          child: Text('Dados pessoais - Anamnese Geral', style: GoogleFonts.jost(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
