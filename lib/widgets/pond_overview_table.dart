import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/pond_status.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';
import 'status_badge.dart';

class PondOverviewTable extends StatelessWidget {
  const PondOverviewTable({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<PondItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textHeading,
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _TableHeader(),
              ...items.asMap().entries.map(
                    (e) => _PondRow(
                      item: e.value,
                      showBorder: e.key < items.length - 1,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.tableHeaderBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        children: [
          _HeaderCell('Name', flex: 3),
          _HeaderCell('pH', flex: 2),
          _HeaderCell('NH3', flex: 2),
          _HeaderCell('DO', flex: 2),
          _HeaderCell('Status', flex: 4),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text, {required this.flex});

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textHeading,
        ),
      ),
    );
  }
}

class _PondRow extends StatelessWidget {
  const _PondRow({required this.item, required this.showBorder});

  final PondItem item;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(bottom: BorderSide(color: AppColors.cardBorder))
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  item.location,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          _ValueCell(item.ph.toStringAsFixed(1), flex: 2),
          _ValueCell(item.nh3.toStringAsFixed(0), flex: 2),
          _ValueCell(item.dissolvedOxygen.toStringAsFixed(0), flex: 2),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: StatusBadge(status: item.status),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCell extends StatelessWidget {
  const _ValueCell(this.value, {required this.flex});

  final String value;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        value,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.statusGood,
        ),
      ),
    );
  }
}
