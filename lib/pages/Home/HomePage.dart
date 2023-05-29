import 'package:flutter/material.dart';
import 'package:vidaleve/pages/Home/widgets/HomeHeader.dart';
import 'package:vidaleve/pages/Home/widgets/HomeMenuList.dart';
import 'package:vidaleve/pages/Home/widgets/HomeSearch.dart';
import 'package:vidaleve/pages/Home/widgets/HomeTitle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(children: [
          HomeHeader(),
          HomeSearch(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [HomeTitle(), HomeMenuList()],
            ),
          )
        ]),
      ),
    );
  }
}
