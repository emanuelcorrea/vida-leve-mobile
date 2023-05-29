import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Breadcrumb extends StatefulWidget {
  final List<String> items;

  const Breadcrumb({super.key, required this.items});

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...widget.items.map((item) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item,
                    style: GoogleFonts.jost(
                        color: const Color(0xFF00588A),
                        fontSize: 28,
                        fontWeight: FontWeight.w500)),
                widget.items.indexOf(item) + 1 < widget.items.length
                    ? const Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                        child: Icon(
                          Icons.circle,
                          color: Color(0xFF00588A),
                          size: 8.0,
                        ),
                      )
                    : const Text(''),
              ],
            ))
      ],
    );
  }
}
