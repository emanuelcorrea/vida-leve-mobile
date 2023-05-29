import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/ForgotPassword/widgets/ForgotPasswordForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/widgets/Loading/Loading.dart';
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
    final bool isLoading = context.watch<SettingsProvider>().isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: const [
                Logo(),
                PageTitle(title: 'Recuperar Senha'),
                ForgotPasswordForm(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: LoginTerms(),
                ),
              ],
            ),
            Loading(isLoading: isLoading),
          ],
        ),
      ),
    );
  }
}
