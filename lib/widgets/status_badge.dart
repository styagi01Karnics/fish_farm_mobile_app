import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/pond_status.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final PondHealthStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: status.color,
        ),
      ),
    );
  }
}

class IdealRangeBadge extends StatelessWidget {
  const IdealRangeBadge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FD),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF0145CC),
        ),
      ),
    );
  }
}
