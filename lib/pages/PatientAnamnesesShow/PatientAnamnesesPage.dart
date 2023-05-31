import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vidaleve/pages/PatientAnamneses/widget/AnamneseItem.dart';
import 'package:vidaleve/pages/PatientAnamnesesShow/widget/AnamneseForm.dart';
import 'package:vidaleve/pages/PatientAnamnesesShow/widget/anamnese_header.dart';
import 'package:vidaleve/pages/PatientDetails/widgets/PatientHeader.dart';
import 'package:vidaleve/widgets/Breadcrumb/Breadcrumb.dart';

class PatientAnamnesesShowPage extends StatefulWidget {

  const PatientAnamnesesShowPage({super.key});

  @override
  State<PatientAnamnesesShowPage> createState() => _PatientAnamnesesShowPageState();
}

class _PatientAnamnesesShowPageState extends State<PatientAnamnesesShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AnamneseHeader(),
            AnamneseForm()
          ],
        ),
      ),
    );
  }
}
