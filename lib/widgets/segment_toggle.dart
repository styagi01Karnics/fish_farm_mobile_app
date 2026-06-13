import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class SegmentToggle extends StatelessWidget {
  const SegmentToggle({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.selectedIndex,
    required this.onChanged,
  });

  final String leftLabel;
  final String rightLabel;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x261814F0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment:
                selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _SegmentTab(
                  label: leftLabel,
                  selected: selectedIndex == 0,
                  onTap: () => onChanged(0),
                ),
              ),
              Expanded(
                child: _SegmentTab(
                  label: rightLabel,
                  selected: selectedIndex == 1,
                  onTap: () => onChanged(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SegmentTab extends StatelessWidget {
  const _SegmentTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              color: selected ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
