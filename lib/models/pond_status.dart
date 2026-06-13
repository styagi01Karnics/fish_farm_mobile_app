import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum PondHealthStatus { good, moderate, poor }

extension PondHealthStatusX on PondHealthStatus {
  String get label => switch (this) {
        PondHealthStatus.good => 'Good',
        PondHealthStatus.moderate => 'Moderate',
        PondHealthStatus.poor => 'Poor',
      };

  Color get color => switch (this) {
        PondHealthStatus.good => AppColors.statusGood,
        PondHealthStatus.moderate => AppColors.statusModerate,
        PondHealthStatus.poor => AppColors.statusPoor,
      };

  Color get background => switch (this) {
        PondHealthStatus.good => AppColors.statusGoodBg,
        PondHealthStatus.moderate => AppColors.statusModerateBg,
        PondHealthStatus.poor => AppColors.statusPoorBg,
      };
}

class PondItem {
  const PondItem({
    required this.name,
    required this.location,
    required this.ph,
    required this.nh3,
    required this.dissolvedOxygen,
    required this.status,
  });

  final String name;
  final String location;
  final double ph;
  final double nh3;
  final double dissolvedOxygen;
  final PondHealthStatus status;
}

class WaterMetric {
  const WaterMetric({
    required this.label,
    required this.value,
    this.idealRange,
    this.valueIsHealthy = true,
  });

  final String label;
  final String value;
  final String? idealRange;
  final bool valueIsHealthy;
}
