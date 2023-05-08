import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PhysicalModel(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          elevation: 5.0,
          shadowColor: const Color.fromARGB(148, 158, 158, 158),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Pesquisa...',
                  hintStyle: GoogleFonts.jost(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF9E9E9E)),
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
