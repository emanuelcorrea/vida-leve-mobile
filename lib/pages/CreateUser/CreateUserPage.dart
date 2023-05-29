import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/pages/CreateUser/widgets/CreateUserForm.dart';
import 'package:vidaleve/pages/Login/widgets/LoginTerms.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/widgets/Loading/loading.dart';
import 'package:vidaleve/widgets/Logo/Logo.dart';
import 'package:vidaleve/widgets/PageTitle/PageTitle.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUserPage> {
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
                PageTitle(title: 'Criar conta'),
                CreateUserForm(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: LoginTerms(),
                ),
              ],
            ),
            Loading(isLoading: isLoading)
          ],
        ),
      ),
    );
  }
}
