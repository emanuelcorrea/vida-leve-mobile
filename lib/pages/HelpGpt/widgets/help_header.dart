import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/model/user.dart';
import 'package:vidaleve/providers/settings_provider.dart';

class HelpHeader extends StatefulWidget {
  const HelpHeader({super.key});

  @override
  State<HelpHeader> createState() => _HeaderState();
}

class _HeaderState extends State<HelpHeader> {
  User? _user;

  loadUser() {
    _user = Provider.of<SettingsProvider>(context).user;
  }

  @override
  Widget build(BuildContext context) {
    loadUser();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bem vindo ao HelpGPT!',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 40)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                    'Auxiiamos você a identificar o seu problema com um diagnóstico rápido.',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
