import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;

  const ForgotButton({super.key, required this.formKey, required this.email});

  @override
  State<ForgotButton> createState() => _ForgotButtonState();
}

class _ForgotButtonState extends State<ForgotButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return const Color(0xFF00588A);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        onPressed: () {
          try {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();

              FirebaseAuth.instance
                  .sendPasswordResetEmail(email: widget.email.text.trim());

              print('nome ${widget.email.text}');
            }
          } catch (e) {
            print(e);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Resetar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
