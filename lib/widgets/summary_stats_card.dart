import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'app_card.dart';

class SummaryStatsCard extends StatelessWidget {
  const SummaryStatsCard({
    super.key,
    required this.totalLabel,
    required this.totalCount,
    required this.goodCount,
    required this.moderateCount,
    required this.poorCount,
  });

  final String totalLabel;
  final int totalCount;
  final int goodCount;
  final int moderateCount;
  final int poorCount;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.water,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalLabel,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHeading,
                    ),
                  ),
                  Text(
                    '$totalCount',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatChip(
                  count: goodCount,
                  label: 'Good',
                  background: AppColors.statusGoodBg,
                  labelColor: AppColors.statusGood,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatChip(
                  count: moderateCount,
                  label: 'Moderate',
                  background: AppColors.statusModerateBg,
                  labelColor: AppColors.statusModerate,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatChip(
                  count: poorCount,
                  label: 'Poor',
                  background: AppColors.statusPoorBg,
                  labelColor: AppColors.statusPoor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.count,
    required this.label,
    required this.background,
    required this.labelColor,
  });

  final int count;
  final String label;
  final Color background;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: labelColor,
            ),
          ),
        ],
      ),
    );
  }
}
