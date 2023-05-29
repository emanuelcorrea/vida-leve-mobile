import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vidaleve/pages/PatientAnamneses/widget/AnamneseItem.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientHeader.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientAnamnesesPage extends StatefulWidget {
  final dynamic patient;

  const PatientAnamnesesPage({super.key, required this.patient});

  @override
  State<PatientAnamnesesPage> createState() => _PatientAnamnesesPageState();
}

class _PatientAnamnesesPageState extends State<PatientAnamnesesPage> {
  @override
  Widget build(BuildContext context) {
    print(GoRouter.of(context).location);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PatientHeader(patient: widget.patient),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Breadcrumb(items: ['Paciente', 'Anamneses']),
                  ),
                  ...widget.patient.anamneses.map((anamnese) => AnamneseItem(
                        anamnese: anamnese,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
