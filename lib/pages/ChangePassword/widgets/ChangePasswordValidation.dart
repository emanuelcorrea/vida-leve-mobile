import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordValidation extends StatefulWidget {
  final dynamic validations;

  const ChangePasswordValidation({
    super.key,
    required this.validations,
  });

  @override
  State<ChangePasswordValidation> createState() =>
      _ChangePasswordValidationState();
}

class _ChangePasswordValidationState extends State<ChangePasswordValidation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.validations.map((validation) => Text(
                validation['label'],
                style: GoogleFonts.jost(
                    color: validation['validation']
                        ? const Color(0xFF00588A)
                        : Colors.black.withAlpha(100),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ))
        ],
      ),
    );
  }
}
