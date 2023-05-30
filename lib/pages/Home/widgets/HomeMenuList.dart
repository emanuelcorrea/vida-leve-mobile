import 'package:flutter/material.dart';
import 'package:vidaleve/pages/Home/widgets/HomeMenuItem.dart';

class HomeMenuList extends StatefulWidget {
  const HomeMenuList({super.key});

  @override
  State<HomeMenuList> createState() => _HomeMenuListState();
}

class _HomeMenuListState extends State<HomeMenuList> {
  final dynamic menuList = [
    {'name': 'Lista de Pacientes', 'route': '/patients'},
    {'name': 'Registro de Pacientes', 'route': '/patients'},
    {'name': 'Acesso as Anamneses', 'route': '/patients'},
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
