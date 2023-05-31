import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/pages/Login/widgets/LoginButton.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForget.dart';
import 'package:vidaleve/widgets/Input/Input.dart';

class AnamneseForm extends StatefulWidget {
  const AnamneseForm({super.key});

  @override
  State<AnamneseForm> createState() => _AnamneseFormState();
}

class _AnamneseFormState extends State<AnamneseForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController estado_civil = TextEditingController();

  @override
  void initState() {
    estado_civil.text = 'Solteiro';
    super.initState();
  }

  @override
  void dispose() {
    estado_civil.dispose();
    estado_civil.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40.0, right: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estado civil',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Estado civil',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cor',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Cor',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Etnia',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Etnia',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Religião',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Religião',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profissão e horário de trabalho',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Profissão e horário de trabalho',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Naturalidade',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Naturalidade',
                  controller: estado_civil,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    'Informações',
                    style: GoogleFonts.jost(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
              ),
            ),

            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Endereço',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Endereço',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bairro',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Bairro',
                  controller: estado_civil,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cidade',
                  style: GoogleFonts.jost(fontSize: 16),
                ),

                Input(
                  placeholder: 'Cidade',
                  controller: estado_civil,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
