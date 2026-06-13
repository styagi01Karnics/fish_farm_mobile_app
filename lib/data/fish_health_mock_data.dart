import 'package:flutter/material.dart';

import '../constants/fish_assets.dart';
import '../models/fish_species.dart';
import '../models/pond_status.dart';
import 'mock_data.dart';

abstract final class FishHealthMockData {
  /// Label on Figma Fish Health screen (node 94:7239); five species are in the file.
  static const speciesCountLabel = '7 species';
  static const _pabdaWaterMetrics = [
    WaterMetric(label: 'pH', value: '7.4', idealRange: 'Ideal: 6.5–8.5'),
    WaterMetric(label: 'Ammonia', value: '0 ppm', idealRange: 'Ideal: 0 ppm'),
    WaterMetric(label: 'Nitrite', value: '0 ppm', idealRange: 'Ideal: 0 ppm'),
    WaterMetric(
      label: 'Nitrate',
      value: '18.00 mg/L',
      idealRange: 'Ideal: < 30 mg/L',
    ),
    WaterMetric(
      label: 'Dissolved Oxygen',
      value: '4.1 mg/L',
      idealRange: 'Ideal: ≥ 6 mg/L',
    ),
    WaterMetric(
      label: 'Water Temperature',
      value: '28.4 °C',
      idealRange: 'Ideal: 26–32 °C',
    ),
    WaterMetric(
      label: 'Alkalinity (KH)',
      value: '120.00 ppm',
      idealRange: 'Ideal: 95–150 ppm',
    ),
    WaterMetric(
      label: 'General Hardness',
      value: '110.0 ppm',
      idealRange: 'Ideal: 75–150 ppm',
    ),
    WaterMetric(
      label: 'Phosphates',
      value: '0.03 mg/L',
      idealRange: 'Ideal: < 0.05 mg/L',
    ),
    WaterMetric(
      label: 'Water Level',
      value: '40 L',
      valueIsHealthy: false,
    ),
  ];

  static const _pabdaDiseaseRisks = [
    DiseaseRiskItem(
      parameter: 'Dissolved Oxygen',
      levelLabel: 'Low',
      levelColor: Color(0xFFEC2023),
      value: '4.1 mg/L',
      riskLabel: 'High Risk',
      riskColor: Color(0xFFEC2023),
      riskBg: Color(0xFFFEEEEF),
      effects: ['Fish Stress', 'Slow Growth', 'Surface Gasping', 'Mortality Risk'],
    ),
    DiseaseRiskItem(
      parameter: 'Ammonia (NH₃)',
      levelLabel: 'High',
      levelColor: Color(0xFFEC2023),
      value: '0.06 ppm',
      riskLabel: 'High Risk',
      riskColor: Color(0xFFEC2023),
      riskBg: Color(0xFFFEEEEF),
      effects: ['Gill Damage', 'Lethargy', 'Redness in Gills', 'Mortality Risk'],
    ),
    DiseaseRiskItem(
      parameter: 'Temperature',
      levelLabel: 'Normal',
      levelColor: Color(0xFF1D9B2E),
      value: '28.6°C',
      riskLabel: 'Medium Risk',
      riskColor: Color(0xFFD2973B),
      riskBg: Color(0xFFFFF6E9),
      effects: ['Oxygen Reduction', 'Loss of Appetite'],
    ),
    DiseaseRiskItem(
      parameter: 'pH',
      levelLabel: 'Normal',
      levelColor: Color(0xFF1D9B2E),
      value: '7.2',
      riskLabel: 'Medium Risk',
      riskColor: Color(0xFFD2973B),
      riskBg: Color(0xFFFFF6E9),
      effects: ['Stress', 'Skin Irritation', 'Gill Damage'],
    ),
  ];

  static const _pabdaRecommendations = [
    'Increase aeration immediately',
    'Reduce feeding for some time',
    'Add zeolite to reduce ammonia',
    'Perform partial water exchange',
    'Maintain proper water quality',
  ];

  static const _pabdaQuickStats = [
    FishQuickStat(
      label: 'Size',
      value: '6 cm',
      icon: Icons.straighten,
      iconColor: Color(0xFF1D9B2E),
      iconBg: Color(0xFFEFFCF3),
    ),
    FishQuickStat(
      label: 'Lifespan',
      value: '2–5 yrs',
      icon: Icons.schedule,
      iconColor: Color(0xFF0145CC),
      iconBg: Color(0xFFDFE9FD),
    ),
    FishQuickStat(
      label: 'Min. Tank',
      value: '40 L',
      icon: Icons.science_outlined,
      iconColor: Color(0xFF0145CC),
      iconBg: Color(0xFFDFE9FD),
    ),
    FishQuickStat(
      label: 'Temp. Range',
      value: '22 - 28°C',
      icon: Icons.thermostat,
      iconColor: Color(0xFFEC2023),
      iconBg: Color(0xFFFEEEEF),
    ),
  ];

  static final List<FishSpecies> species = [
    const FishSpecies(
      id: 'pabda',
      name: 'Pabda',
      scientificName: 'Ompok pabda',
      imageAsset: FishAssets.listAvatar,
      detailImageAsset: FishAssets.pabdaDetail,
      health: FishHealthLevel.healthy,
      tags: ['Freshwater', 'Biofloc friendly', 'Sensitive'],
      waterRange: FishWaterRange(
        ph: '6.5-7.8',
        temperature: '25-32°C',
        dissolvedOxygen: '>5.5ppm',
      ),
      description:
          'Pabda is a peaceful schooling fish, ideal for beginners. It adapts well to community tanks and calm waters.',
      proTip:
          'Keep in groups of 6 or more for best color and reduced stress',
      quickStats: _pabdaQuickStats,
      waterMetrics: _pabdaWaterMetrics,
      diseaseRisks: _pabdaDiseaseRisks,
      recommendations: _pabdaRecommendations,
    ),
    const FishSpecies(
      id: 'shrimp',
      name: 'Shrimp (Vannamei)',
      scientificName: 'Litopenaeus vannamei',
      imageAsset: FishAssets.listAvatar,
      health: FishHealthLevel.monitor,
      tags: ['Freshwater', 'Sensitive'],
      waterRange: FishWaterRange(
        ph: '6.5-7.8',
        temperature: '25-32°C',
        dissolvedOxygen: '>5.5ppm',
      ),
      description:
          'Vannamei shrimp thrive in brackish to marine conditions with stable water quality.',
      proTip: 'Monitor ammonia closely during molting periods.',
      quickStats: [
        FishQuickStat(
          label: 'Size',
          value: '12 cm',
          icon: Icons.straighten,
          iconColor: Color(0xFF1D9B2E),
          iconBg: Color(0xFFEFFCF3),
        ),
        FishQuickStat(
          label: 'Lifespan',
          value: '1–2 yrs',
          icon: Icons.schedule,
          iconColor: Color(0xFF0145CC),
          iconBg: Color(0xFFDFE9FD),
        ),
        FishQuickStat(
          label: 'Min. Tank',
          value: '100 L',
          icon: Icons.science_outlined,
          iconColor: Color(0xFF0145CC),
          iconBg: Color(0xFFDFE9FD),
        ),
        FishQuickStat(
          label: 'Temp. Range',
          value: '26 - 30°C',
          icon: Icons.thermostat,
          iconColor: Color(0xFFEC2023),
          iconBg: Color(0xFFFEEEEF),
        ),
      ],
      waterMetrics: MockData.waterMetrics,
    ),
    const FishSpecies(
      id: 'pangasius',
      name: 'Pangasius',
      scientificName: 'Pangasianodon spp.',
      imageAsset: FishAssets.listAvatar,
      health: FishHealthLevel.healthy,
      tags: ['Freshwater', 'Biofloc friendly', 'Sensitive'],
      waterRange: FishWaterRange(
        ph: '6.5-7.8',
        temperature: '25-32°C',
        dissolvedOxygen: '>5.5ppm',
      ),
      description:
          'Hardy catfish species widely farmed; tolerates moderate density with good aeration.',
      proTip: 'Provide hiding spots to reduce stress in high-density ponds.',
      quickStats: _pabdaQuickStats,
      waterMetrics: MockData.waterMetrics,
    ),
    const FishSpecies(
      id: 'rohu',
      name: 'Rohu',
      scientificName: 'Labeo rohita',
      imageAsset: FishAssets.listAvatar,
      health: FishHealthLevel.risky,
      tags: ['Freshwater', 'Biofloc friendly', 'Sensitive'],
      waterRange: FishWaterRange(
        ph: '6.5-7.8',
        temperature: '25-32°C',
        dissolvedOxygen: '>5.5ppm',
      ),
      description:
          'Major carp species for polyculture; sensitive to low dissolved oxygen.',
      proTip: 'Increase aeration when stocking density is high.',
      quickStats: _pabdaQuickStats,
      waterMetrics: MockData.waterMetrics,
      diseaseRisks: _pabdaDiseaseRisks,
      recommendations: _pabdaRecommendations,
    ),
    const FishSpecies(
      id: 'tilapia',
      name: 'Thilapia',
      scientificName: 'Oreochromis spp',
      imageAsset: FishAssets.listAvatar,
      health: FishHealthLevel.risky,
      tags: ['Freshwater', 'Biofloc friendly', 'Sensitive'],
      waterRange: FishWaterRange(
        ph: '6.5-7.8',
        temperature: '25-32°C',
        dissolvedOxygen: '>5.5ppm',
      ),
      description:
          'Fast-growing tilapia suitable for warm climates; monitor water temperature.',
      proTip: 'Avoid overfeeding to maintain water quality.',
      quickStats: _pabdaQuickStats,
      waterMetrics: MockData.waterMetrics,
      diseaseRisks: _pabdaDiseaseRisks,
      recommendations: _pabdaRecommendations,
    ),
  ];

  static FishSpecies? byId(String id) {
    for (final s in species) {
      if (s.id == id) return s;
    }
    return null;
  }

  static List<FishSpecies> search(String query) {
    if (query.trim().isEmpty) return species;
    final q = query.toLowerCase();
    return species
        .where(
          (s) =>
              s.name.toLowerCase().contains(q) ||
              s.scientificName.toLowerCase().contains(q),
        )
        .toList();
  }
}
