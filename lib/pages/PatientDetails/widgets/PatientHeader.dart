import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/model/Patient.dart';

class PatientHeader extends StatefulWidget {
  final Patient patient;

  const PatientHeader({super.key, required this.patient});

  @override
  State<PatientHeader> createState() => _PatientHeaderState();
}

class _PatientHeaderState extends State<PatientHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height / 6,
      decoration: const BoxDecoration(color: Color(0xFF00588A), boxShadow: [
        BoxShadow(
          color: Color.fromARGB(148, 158, 158, 158),
          blurRadius: 3,
          offset: Offset(0, 8), // Shadow position
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 90,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.patient.name,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
