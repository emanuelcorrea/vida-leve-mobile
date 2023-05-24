import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/pages/Home/widgets/HomeHeader.dart';
import 'package:vidaleve/pages/Home/widgets/HomeMenuList.dart';
import 'package:vidaleve/pages/Home/widgets/HomeSearch.dart';
import 'package:vidaleve/pages/Home/widgets/HomeTitle.dart';
import 'package:vidaleve/utils/authentication_service.dart';
import 'package:vidaleve/widgets/ToastNotification/ToastNotification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authService = AuthenticationService();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeHeader(),
          const HomeSearch(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [HomeTitle(), HomeMenuList()],
            ),
          )
        ],
      ),
    );
  }
}
