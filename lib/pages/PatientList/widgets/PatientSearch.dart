import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientSearch extends StatefulWidget {
  final dynamic onChange;

  const PatientSearch({
    super.key,
    required this.onChange,
  });

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  final TextEditingController _searchController = TextEditingController();

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
              controller: _searchController,
              onChanged: (value) => widget.onChange(value),
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
