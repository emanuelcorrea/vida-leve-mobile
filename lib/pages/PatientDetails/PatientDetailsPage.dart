import 'package:flutter/material.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientHeader.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientInfo.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientDetailsPage extends StatefulWidget {
  final dynamic patient;
  
  const PatientDetailsPage({super.key, required this.patient});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          PatientHeader(patient: widget.patient),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Breadcrumb(items: ['Paciente', 'Detalhes']),
                PatientInfo(info: widget.patient.name),
                PatientInfo(info: "Data de nascimento: ${widget.patient.birthDate}"),
                PatientInfo(info: "Telefone: ${widget.patient.phone}"),
                PatientInfo(info: "Endereço: ${widget.patient.address}"),
                PatientInfo(info: "Estado Civil: ${widget.patient.maritalStatus}"),
                PatientInfo(info: "Cidade: ${widget.patient.city}"),
                PatientInfo(info: "Profissão: ${widget.patient.job}"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
