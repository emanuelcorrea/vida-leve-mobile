import 'package:flutter/material.dart';
import 'package:vidaleve/pages/HelpGpt/widgets/help_form.dart';
import 'package:vidaleve/pages/HelpGpt/widgets/help_header.dart';
import 'package:vidaleve/pages/HelpGpt/widgets/help_title.dart';

class HelpGpt extends StatefulWidget {
  const HelpGpt({super.key});

  @override
  State<HelpGpt> createState() => _HelpGptState();
}

class _HelpGptState extends State<HelpGpt> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HelpHeader(),
            HelpTitle(),
            HelpForm(),
          ],
        ),
      ),
    );
  }
}
