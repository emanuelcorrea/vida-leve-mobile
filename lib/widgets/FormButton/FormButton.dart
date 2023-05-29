// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final dynamic onPressed;
  dynamic color;
  dynamic backgroundColor;

  FormButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.backgroundColor = const Color(0xFF00588A),
  });

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.backgroundColor;
            }
            return widget.backgroundColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();
          widget.onPressed(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: GoogleFonts.jost(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
