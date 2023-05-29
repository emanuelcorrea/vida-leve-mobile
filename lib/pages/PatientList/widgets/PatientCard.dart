import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/model/Patient.dart';

class PatientCard extends StatefulWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  _onTap() {
    context.push('/patient', extra: widget.patient);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 25),
        child: PhysicalModel(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF00588A),
          elevation: 5.0,
          shadowColor: const Color.fromARGB(148, 158, 158, 158),
          child: Container(
            height: 102.0,
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(widget.patient.name,
                      style: GoogleFonts.jost(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
