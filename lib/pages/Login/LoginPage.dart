import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/Login/widgets/LoginCreateUser.dart';
import 'package:vidaleve/pages/Login/widgets/LoginForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/widgets/Loading/Loading.dart';
import 'package:vidaleve/widgets/Logo/Logo.dart';
import 'package:vidaleve/widgets/PageTitle/PageTitle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.watch<SettingsProvider>().isLoading;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: const [
                Logo(),
                PageTitle(title: 'Login'),
                LoginForm(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 120.0, vertical: 5.0),
                  child: LoginCreateUser(),
                ),
                LoginTerms()
              ],
            ),
            Loading(isLoading: isLoading)
          ],
        ),
      ),
    );
  }
}
