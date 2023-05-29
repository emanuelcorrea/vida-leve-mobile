import 'package:flutter/material.dart';

class PatientHeader extends StatefulWidget {
  const PatientHeader({super.key});

  @override
  State<PatientHeader> createState() => _HeaderState();
}

class _HeaderState extends State<PatientHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(color: Color(0xFF00588A), boxShadow: [
        BoxShadow(
          color: Color.fromARGB(148, 158, 158, 158),
          blurRadius: 3,
          offset: Offset(0, 8), // Shadow position
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: null,
        ),
      ),
    );
  }
}
