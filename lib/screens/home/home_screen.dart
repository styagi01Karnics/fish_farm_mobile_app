import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../widgets/pond_overview_table.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/segment_toggle.dart';
import '../../widgets/summary_stats_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _segmentIndex = 0;

  bool get _isBiofloc => _segmentIndex == 1;

  @override
  Widget build(BuildContext context) {
    final items = _isBiofloc ? MockData.bioflocs : MockData.ponds;
    final totalLabel = _isBiofloc ? 'Total Bioflocs' : 'Total Ponds';
    final overviewTitle =
        _isBiofloc ? 'Biofloc Status Overview' : 'Pond Status Overview';

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
            title: 'Good Morning, ${MockData.userName} 👋',
            subtitle: 'Track pond health instantly',
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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SummaryStatsCard(
              totalLabel: totalLabel,
              totalCount: 24,
              goodCount: 14,
              moderateCount: 6,
              poorCount: 4,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PondOverviewTable(
              title: overviewTitle,
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
