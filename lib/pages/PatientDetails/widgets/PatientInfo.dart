import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientInfo extends StatefulWidget {
  final dynamic info;

  const PatientInfo({super.key, required this.info});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF00588A),
        elevation: 5.0,
        shadowColor: const Color.fromARGB(148, 158, 158, 158),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
            child: Text(widget.info,
                style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
