import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/model/Patient.dart';

class PatientHeader extends StatefulWidget {
  final Patient patient;

  const PatientHeader({super.key, required this.patient});

  @override
  State<PatientHeader> createState() => _HeaderState();
}

class _HeaderState extends State<PatientHeader> {
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.patient.name,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text('Idade: ${widget.patient.age} anos',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14)),
                    ),
                    Text('Telefone: ${widget.patient.phone}',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
