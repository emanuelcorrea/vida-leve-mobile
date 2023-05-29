import 'package:flutter/material.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientHeader.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientInfo.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final patient = ModalRoute.of(context)!.settings.arguments as Patient;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          PatientHeader(patient: patient),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Breadcrumb(items: ['Paciente', 'Detalhes']),
                PatientInfo(info: patient.name),
                PatientInfo(info: "Data de nascimento: ${patient.birthDate}"),
                PatientInfo(info: "Telefone: ${patient.phone}"),
                PatientInfo(info: "Endereço: ${patient.address}"),
                PatientInfo(info: "Estado Civil: ${patient.maritalStatus}"),
                PatientInfo(info: "Cidade: ${patient.city}"),
                PatientInfo(info: "Profissão: ${patient.job}"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
