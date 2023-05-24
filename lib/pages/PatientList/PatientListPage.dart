import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/PatientList/widgets/PatientCard.dart';
import 'package:vidaleve/pages/PatientList/widgets/PatientHeader.dart';
import 'package:vidaleve/pages/PatientList/widgets/PatientSearch.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  final dynamic patients = [
    {
      "name": "Leonardo Magalhães"
    },
    {
      "name": "Leonardo Enrico"
    },
    {
      "name": "Luiz Daniel de Oliveira"
    },
    {
      "name": "Emanuel Correa"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PatientHeader(),
            const PatientSearch(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Breadcrumb(items: ['Home', 'Pacientes']),
            ),
            Column(
              children: [
                ...patients.map((patient) => PatientCard(patient: patient))
              ],
            )
            
          ],
        ),
      ),
    );
  }
}