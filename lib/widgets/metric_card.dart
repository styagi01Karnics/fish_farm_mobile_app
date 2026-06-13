import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/pond_status.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';
import 'status_badge.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({super.key, required this.metric});

  final WaterMetric metric;

  @override
  Widget build(BuildContext context) {
    final valueColor =
        metric.valueIsHealthy ? AppColors.statusGood : AppColors.textPrimary;

    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric.label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textHeading,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            metric.value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
          if (metric.idealRange != null) ...[
            const SizedBox(height: 8),
            IdealRangeBadge(text: metric.idealRange!),
          ],
        ],
      ),
    );
  }
}
