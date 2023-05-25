import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/pages/Home/widgets/HomeMenuList.dart';
import 'package:vidaleve/pages/Patient/widgets/PatientHeader.dart';
import 'package:vidaleve/pages/Patient/widgets/PatientMenuList.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    final patient = ModalRoute.of(context)!.settings.arguments as Patient;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PatientHeader(patient: patient),
            Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 28.0),
              child: Column(
                children: [
                  const Breadcrumb(items: ['Paciente']),
                  PatientMenuList(patient: patient)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
