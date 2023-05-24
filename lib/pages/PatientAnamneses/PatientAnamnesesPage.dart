import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/pages/PatientAnamneses/widget/AnamneseItem.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientHeader.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientAnamnesesPage extends StatefulWidget {
  const PatientAnamnesesPage({super.key});

  @override
  State<PatientAnamnesesPage> createState() => _PatientAnamnesesPageState();
}

class _PatientAnamnesesPageState extends State<PatientAnamnesesPage> {
  @override
  Widget build(BuildContext context) {
    final patient = ModalRoute.of(context)!.settings.arguments as Patient;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PatientHeader(patient: patient),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Breadcrumb(items: ['Paciente', 'Anamneses']),
                  ),
                  ...patient.anamneses.map((anamnese) => AnamneseItem(
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
