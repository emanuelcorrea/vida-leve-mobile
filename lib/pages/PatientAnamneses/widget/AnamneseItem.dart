import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return GestureDetector(
      onTap: () {
        context.push('/patients/patient/anamneses/show', extra: widget.anamnese);
      },
      child: Padding(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.menu_book, color: Colors.white, size: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Anamnese Geral',
                            style: GoogleFonts.jost(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      Text('31/05/2023',
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
