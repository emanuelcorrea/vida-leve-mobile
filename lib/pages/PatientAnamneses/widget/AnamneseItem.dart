import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/model/patientAnamnese.dart';

class AnamneseItem extends StatefulWidget {
  final PatientAnamnese anamnese;

  const AnamneseItem({super.key, required this.anamnese});

  @override
  State<AnamneseItem> createState() => _AnamneseItemState();
}

class _AnamneseItemState extends State<AnamneseItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF00588A),
        elevation: 5.0,
        shadowColor: const Color.fromARGB(148, 158, 158, 158),
        child: Container(
          width: double.infinity,
          height: 85.0,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Icon(Icons.menu_book, color: Colors.white, size: 60),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Text(widget.anamnese.date,
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.anamnese.time,
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
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
