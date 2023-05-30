import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/model/user.dart';
import 'package:vidaleve/providers/settings_provider.dart';

class HelpChatHeader extends StatefulWidget {
  const HelpChatHeader({super.key});

  @override
  State<HelpChatHeader> createState() => _HeaderState();
}

class _HeaderState extends State<HelpChatHeader> {
  User? _user;

  loadUser() {
    _user = Provider.of<SettingsProvider>(context).user;
  }

  @override
  Widget build(BuildContext context) {
    loadUser();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4.5,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HelpGPT!',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 40)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
