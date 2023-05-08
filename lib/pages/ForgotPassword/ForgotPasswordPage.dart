import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotPasswordForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/widgets/Logo/Logo.dart';
import 'package:vidaleve/widgets/PageTitle/PageTitle.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: const [
            Logo(),
            PageTitle(title: 'Resetar Senha'),
            ForgotPasswordForm(),
            Spacer(),
            LoginTerms()
          ],
        ),
      ),
    );
  }
}
