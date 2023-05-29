import 'package:flutter/material.dart';
import 'package:vidaleve/main.dart';

class LoginScaffold extends StatefulWidget {
  const LoginScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<LoginScaffold> createState() => _LoginScaffoldState();
}

class _LoginScaffoldState extends State<LoginScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      body: widget.child,
    );
  }
}
