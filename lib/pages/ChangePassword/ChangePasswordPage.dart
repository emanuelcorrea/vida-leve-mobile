import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/ChangePassword/widgets/ChangePasswordForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/widgets/Loading/Loading.dart';
import 'package:vidaleve/widgets/Logo/Logo.dart';
import 'package:vidaleve/widgets/PageTitle/PageTitle.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final bool isLoading = Provider.of<SettingsProvider>(context).isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: const [
              Logo(),
              PageTitle(title: 'Nova senha'),
              ChangePasswordForm(),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: LoginTerms(),
              )
            ],
          ),
          Loading(isLoading: isLoading)
        ],
      ),
    );
  }
}
