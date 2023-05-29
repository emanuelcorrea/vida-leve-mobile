import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/model/Patient.dart';

class PatientMenuItem extends StatefulWidget {
  final dynamic item;
  final Patient patient;

  const PatientMenuItem({super.key, required this.item, required this.patient});

  @override
  State<PatientMenuItem> createState() => _PatientMenuItemState();
}

class _PatientMenuItemState extends State<PatientMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.push(widget.item['route'], extra: widget.patient);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xFF00588A);
                }
                return const Color(0xFF00588A);
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  widget.item['name'],
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              const Text('+',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
