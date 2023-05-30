import 'package:flutter/material.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/pages/Patient/widgets/PatientMenuItem.dart';

class PatientMenuList extends StatefulWidget {
  final Patient? patient;

  const PatientMenuList({super.key, required this.patient});

  @override
  State<PatientMenuList> createState() => _PatientMenuListState();
}

class _PatientMenuListState extends State<PatientMenuList> {
  final dynamic menuList = [
    {
      'name': 'Anamneses',
      'route': '/patients/patient/anamneses',
    },
    {
      'name': 'Histórico de consultas',
      'route': '/patients/patient/consultation-history',
    },
    {
      'name': 'Mais informações',
      'route': '/patients/patient/details',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Column(children: [
        Column(
          children: [
            ...menuList.map((item) =>
                PatientMenuItem(item: item, patient: widget.patient as Patient))
          ],
        )
      ]),
    );
  }
}
