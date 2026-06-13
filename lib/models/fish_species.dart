import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'pond_status.dart';

enum FishHealthLevel { healthy, monitor, risky }

extension FishHealthLevelX on FishHealthLevel {
  String get label => switch (this) {
        FishHealthLevel.healthy => 'Healthy',
        FishHealthLevel.monitor => 'Monitor',
        FishHealthLevel.risky => 'Risky',
      };

  Color get color => switch (this) {
        FishHealthLevel.healthy => AppColors.statusGood,
        FishHealthLevel.monitor => AppColors.statusModerate,
        FishHealthLevel.risky => AppColors.statusPoor,
      };

  Color get background => switch (this) {
        FishHealthLevel.healthy => AppColors.statusGoodBg,
        FishHealthLevel.monitor => AppColors.statusModerateBg,
        FishHealthLevel.risky => AppColors.statusPoorBg,
      };
}

class FishWaterRange {
  const FishWaterRange({
    required this.ph,
    required this.temperature,
    required this.dissolvedOxygen,
  });

  final String ph;
  final String temperature;
  final String dissolvedOxygen;
}

class FishQuickStat {
  const FishQuickStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
}

class DiseaseRiskItem {
  const DiseaseRiskItem({
    required this.parameter,
    required this.levelLabel,
    required this.levelColor,
    required this.value,
    required this.riskLabel,
    required this.riskColor,
    required this.riskBg,
    required this.effects,
  });

  final String parameter;
  final String levelLabel;
  final Color levelColor;
  final String value;
  final String riskLabel;
  final Color riskColor;
  final Color riskBg;
  final List<String> effects;
}

class FishSpecies {
  const FishSpecies({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.health,
    required this.tags,
    required this.waterRange,
    required this.description,
    required this.proTip,
    required this.quickStats,
    required this.imageAsset,
    this.detailImageAsset,
    this.waterMetrics,
    this.diseaseRisks,
    this.recommendations,
  });

  final String id;
  final String name;
  final String scientificName;
  /// List/card thumbnail from Figma Fish Health (node 94:7223).
  final String imageAsset;
  /// Larger hero image for detail header; falls back to [imageAsset].
  final String? detailImageAsset;

  String get detailImage => detailImageAsset ?? imageAsset;
  final FishHealthLevel health;
  final List<String> tags;
  final FishWaterRange waterRange;
  final String description;
  final String proTip;
  final List<FishQuickStat> quickStats;
  final List<WaterMetric>? waterMetrics;
  final List<DiseaseRiskItem>? diseaseRisks;
  final List<String>? recommendations;
}
