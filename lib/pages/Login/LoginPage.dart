import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForget.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTitle.dart';
import 'package:vidaleve/pages/Login/widgets/Logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [Logo(), LoginTitle(), LoginForm(), Spacer(), LoginTerms()],
        ),
      ),
    );
  }
}
