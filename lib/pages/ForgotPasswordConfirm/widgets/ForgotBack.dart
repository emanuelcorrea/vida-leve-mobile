import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotBack extends StatefulWidget {
  const ForgotBack({super.key});

  @override
  State<ForgotBack> createState() => _ForgotBackState();
}

class _ForgotBackState extends State<ForgotBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xFF00588A);
              }
              return const Color(0xFFFFFFFF);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Voltar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF00588A))),
        ),
      ),
    );
  }
}
