import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Home',
          style: GoogleFonts.jost(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00588A))),
    );
  }
}
