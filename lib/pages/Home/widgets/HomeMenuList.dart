import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidaleve/pages/Home/widgets/HomeMenuItem.dart';

class HomeMenuList extends StatefulWidget {
  const HomeMenuList({super.key});

  @override
  State<HomeMenuList> createState() => _HomeMenuListState();
}

class _HomeMenuListState extends State<HomeMenuList> {
  final dynamic menuList = [
    {'name': 'Lista de Pacientes'},
    {'name': 'Registro de Pacientes'},
    {'name': 'Acesso as Anamneses'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Column(children: [
        Column(
          children: [...menuList.map((item) => HomeMenuItem(item: item))],
        )
      ]),
    );
  }
}
