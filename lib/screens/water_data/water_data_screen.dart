import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/metric_card.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/segment_toggle.dart';

class WaterDataScreen extends StatefulWidget {
  const WaterDataScreen({super.key});

  @override
  State<WaterDataScreen> createState() => _WaterDataScreenState();
}

class _WaterDataScreenState extends State<WaterDataScreen> {
  int _segmentIndex = 0;
  String _selectedPond = MockData.pondSelectors.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeader(
            title: 'Water Data',
            subtitle: 'Live water quality insights',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentToggle(
              leftLabel: 'Ponds',
              rightLabel: 'Biofloc',
              selectedIndex: _segmentIndex,
              onChanged: (i) => setState(() => _segmentIndex = i),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _LiveStatusBar(),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _PondSelector(
              value: _selectedPond,
              options: MockData.pondSelectors,
              onChanged: (v) => setState(() => _selectedPond = v),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.25,
              ),
              itemCount: MockData.waterMetrics.length,
              itemBuilder: (context, index) {
                return MetricCard(metric: MockData.waterMetrics[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.liveGreenBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.statusGood,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Live',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.statusGood,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 1,
            height: 14,
            color: AppColors.statusGood.withValues(alpha: 0.4),
          ),
          Expanded(
            child: Text(
              'Last update 23 May, 10:30 AM',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.statusGood,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PondSelector extends StatelessWidget {
  const _PondSelector({
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: options
              .map(
                (o) => DropdownMenuItem(
                  value: o,
                  child: Text(
                    o,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
