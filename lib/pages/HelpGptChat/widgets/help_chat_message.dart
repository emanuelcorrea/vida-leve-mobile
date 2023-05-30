import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpChatMessage extends StatefulWidget {
  final String message;
  final String type;

  const HelpChatMessage({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  State<HelpChatMessage> createState() => HelpChatMessageState();
}

class HelpChatMessageState extends State<HelpChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin:
          EdgeInsets.only(bottom: 15.0, left: widget.type == 'user' ? 35 : 0),
      decoration: BoxDecoration(
        color:
            widget.type == 'user' ? Colors.grey[300] : const Color(0xFF00588A),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        widget.message,
        style: GoogleFonts.roboto(
          fontSize: 16,
          color: widget.type == 'user' ? Colors.black87 : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
