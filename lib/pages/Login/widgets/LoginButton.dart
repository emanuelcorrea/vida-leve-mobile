import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  const LoginButton(
      {super.key,
      required this.formKey,
      required this.email,
      required this.password});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          try {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();

              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: widget.email.text.trim(),
                      password: widget.password.text.trim())
                  .catchError((value) =>
                      // ignore: invalid_return_type_for_catch_error
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("E-mail ou senha incorretos!"),
                      )));

              print('nome ${widget.email.text}');
              print('password ${widget.password.text}');
            }
          } catch (e) {
            print(e);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Entrar',
              style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
