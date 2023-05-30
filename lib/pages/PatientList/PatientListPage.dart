import 'package:flutter/material.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/model/patientAnamnese.dart';
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
  List<Patient> patients = [
    Patient(
        name: 'Leticia Vieira',
        phone: '123456789',
        age: 20,
        city: "Boa Vista",
        address: "Avenida Presidente Vargas, 1265 Alto da Boa Vista",
        birthDate: "31/12/2000",
        job: "Tech Lead",
        maritalStatus: "Solteira",
        anamneses: [
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30')
        ]),
    Patient(
        name: 'Leonardo Magalhães',
        phone: '123456789',
        age: 20,
        city: "Boa Vista",
        address: "Avenida Presidente Vargas, 1265 Alto da Boa Vista",
        birthDate: "31/12/2000",
        job: "Tech Lead",
        maritalStatus: "Solteiro",
        anamneses: [
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30')
        ]),
    Patient(
        name: 'Leonardo Enrico',
        phone: '123456789',
        age: 20,
        city: "Boa Vista",
        address: "Avenida Presidente Vargas, 1265 Alto da Boa Vista",
        birthDate: "31/12/2000",
        job: "Tech Lead",
        maritalStatus: "Solteiro",
        anamneses: [
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30')
        ]),
    Patient(
        name: 'Luiz Daniel de Oliveira',
        phone: '123456789',
        age: 20,
        city: "Boa Vista",
        address: "Avenida Presidente Vargas, 1265 Alto da Boa Vista",
        birthDate: "31/12/2000",
        job: "Tech Lead",
        maritalStatus: "Solteiro",
        anamneses: [
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30')
        ]),
    Patient(
        name: 'Emanuel Correa',
        phone: '123456789',
        age: 20,
        city: "Boa Vista",
        address: "Avenida Presidente Vargas, 1265 Alto da Boa Vista",
        birthDate: "31/12/2000",
        job: "Tech Lead",
        maritalStatus: "Solteiro",
        anamneses: [
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30'),
          PatientAnamnese(date: '31/12/2020', time: '15:30')
        ]),
  ];

  List<Patient> patientsFiltered = [];

  @override
  void initState() {
    patientsFiltered = patients;

    super.initState();
  }

  Future refresh() async {
    setState(() {
      patients = [...patients];
    });
  }

  void onChange(String value) {
    setState(() {
      patientsFiltered = patients
          .where((patient) =>
              patient.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PatientHeader(),
            PatientSearch(onChange: onChange),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Breadcrumb(items: ['Home', 'Pacientes']),
            ),
            RefreshIndicator(
              onRefresh: refresh,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: patientsFiltered.length,
                    itemBuilder: (context, index) => PatientCard(
                      patient: patientsFiltered[index],
                    ),
                  ),
                ),
              ),
            ),
            // Column(
            //   children: [
            //     ...patients.map((patient) => PatientCard(patient: patient))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
