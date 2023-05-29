import 'package:flutter/material.dart';
import 'package:vidaleve/pages/Patient/widgets/PatientHeader.dart';
import 'package:vidaleve/pages/Patient/widgets/PatientMenuList.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientPage extends StatefulWidget {
  final dynamic patient;

  const PatientPage({super.key, required this.patient});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PatientHeader(patient: widget.patient),
            Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 28.0),
              child: Column(
                children: [
                  const Breadcrumb(items: ['Paciente']),
                  PatientMenuList(patient: widget.patient)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
