import 'package:vidaleve/model/patientAnamnese.dart';

class Patient {
  final String name, phone, address, city, job, maritalStatus, birthDate;
  final int age;
  final List<PatientAnamnese> anamneses;

  Patient({
    required this.name,
    required this.phone,
    required this.age,
    required this.address,
    required this.city,
    required this.job,
    required this.birthDate,
    required this.anamneses,
    required this.maritalStatus,
  });
}
