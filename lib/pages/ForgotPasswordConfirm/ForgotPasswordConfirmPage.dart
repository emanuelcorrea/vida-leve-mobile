import 'package:flutter/material.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotBack.dart';
import 'package:vidaleve/pages/ForgotPasswordConfirm/widgets/ForgotPasswordConfirmForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/widgets/Logo/Logo.dart';
import 'package:vidaleve/widgets/PageTitle/PageTitle.dart';

class ForgotPasswordConfirmPage extends StatefulWidget {
  const ForgotPasswordConfirmPage({super.key});

  @override
  State<ForgotPasswordConfirmPage> createState() =>
      _ForgotPasswordConfirmPageState();
}

class _ForgotPasswordConfirmPageState extends State<ForgotPasswordConfirmPage> {
  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isLoaded = true;
      });
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isLoaded ? 1.0 : 0.0,
          child: const Column(
            children: [
              Logo(),
              PageTitle(title: 'Confirmar código'),
              ForgotPasswordConfirmForm(),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 40.0, right: 50.0),
                child: ForgotBack(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: LoginTerms(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
