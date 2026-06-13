import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/fish_health_mock_data.dart';
import '../../models/fish_species.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_card.dart';
import '../../widgets/fish_detail_header.dart';
import '../../widgets/horizontal_tab_bar.dart';
import '../../widgets/metric_card.dart';
import '../../widgets/tag_chip.dart';

class FishDetailScreen extends StatefulWidget {
  const FishDetailScreen({super.key, required this.speciesId});

  final String speciesId;

  @override
  State<FishDetailScreen> createState() => _FishDetailScreenState();
}

class _FishDetailScreenState extends State<FishDetailScreen> {
  int _tabIndex = 0;

  static const _tabs = [
    'Overview',
    'Water',
    'Disease Risk',
    'Recommendation',
  ];

  FishSpecies? get _species => FishHealthMockData.byId(widget.speciesId);

  @override
  Widget build(BuildContext context) {
    final species = _species;
    if (species == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Fish Detail')),
        body: const Center(child: Text('Species not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
              child: Row(
                children: [
                  Material(
                    color: AppColors.white,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () => context.pop(),
                      customBorder: const CircleBorder(),
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(Icons.chevron_left, size: 28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Fish Detail',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FishDetailHeader(species: species),
                    const SizedBox(height: 16),
                    HorizontalTabBar(
                      tabs: _tabs,
                      selectedIndex: _tabIndex,
                      onSelected: (i) => setState(() => _tabIndex = i),
                    ),
                    const SizedBox(height: 20),
                    _buildTabContent(species),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(FishSpecies species) {
    return switch (_tabIndex) {
      0 => _OverviewTab(species: species),
      1 => _WaterTab(species: species),
      2 => _DiseaseRiskTab(species: species),
      _ => _RecommendationTab(species: species),
    };
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({required this.species});

  final FishSpecies species;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          species.description,
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.6,
            color: AppColors.textHeading,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: AppColors.separator, height: 1),
        const SizedBox(height: 16),
        Text(
          'Quick Stats',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.35,
          ),
          itemCount: species.quickStats.length,
          itemBuilder: (context, i) {
            final stat = species.quickStats[i];
            return AppCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: stat.iconBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(stat.icon, color: stat.iconColor, size: 20),
                  ),
                  const Spacer(),
                  Text(
                    stat.label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textHeading,
                    ),
                  ),
                  Text(
                    stat.value,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF5CF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFFD2973B),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pro Tip',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textHeading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      species.proTip,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WaterTab extends StatelessWidget {
  const _WaterTab({required this.species});

  final FishSpecies species;

  @override
  Widget build(BuildContext context) {
    final metrics = species.waterMetrics ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.25,
          ),
          itemCount: metrics.length,
          itemBuilder: (context, i) => MetricCard(metric: metrics[i]),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.liveGreenBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.sentiment_satisfied_alt,
                  color: AppColors.statusGood),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'All parameters are in safe range for ${species.name}.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DiseaseRiskTab extends StatelessWidget {
  const _DiseaseRiskTab({required this.species});

  final FishSpecies species;

  @override
  Widget build(BuildContext context) {
    final risks = species.diseaseRisks;
    if (risks == null || risks.isEmpty) {
      return Text(
        'No disease risk data for ${species.name}.',
        style: GoogleFonts.inter(color: AppColors.textSecondary),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Disease Risk Based on Parameters',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        ...risks.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppColors.textHeading,
                              ),
                              children: [
                                TextSpan(text: '${r.parameter} : '),
                                TextSpan(
                                  text: r.levelLabel,
                                  style: TextStyle(color: r.levelColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        HealthLevelBadge(
                          label: r.riskLabel,
                          color: r.riskColor,
                          background: r.riskBg,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      r.value,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Divider(color: AppColors.separator, height: 24),
                    Text(
                      'Effects',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children:
                          r.effects.map((e) => TagChip(label: e)).toList(),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class _RecommendationTab extends StatelessWidget {
  const _RecommendationTab({required this.species});

  final FishSpecies species;

  @override
  Widget build(BuildContext context) {
    final items = species.recommendations;
    if (items == null || items.isEmpty) {
      return Text(
        'No recommendations for ${species.name}.',
        style: GoogleFonts.inter(color: AppColors.textSecondary),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Actions',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.liveGreenBg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x261814F3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            children: items
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.statusGood,
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            text,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
