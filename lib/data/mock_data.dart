import '../models/pond_status.dart';

abstract final class MockData {
  static const String userName = 'Rajesh';

  static const List<PondItem> ponds = [
    PondItem(
      name: 'Pond A',
      location: 'North',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.good,
    ),
    PondItem(
      name: 'Pond B',
      location: 'East',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.moderate,
    ),
    PondItem(
      name: 'Pond A',
      location: 'North',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.poor,
    ),
  ];

  static const List<PondItem> bioflocs = [
    PondItem(
      name: 'Biofloc A',
      location: 'North',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.good,
    ),
    PondItem(
      name: 'Biofloc B',
      location: 'East',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.moderate,
    ),
    PondItem(
      name: 'Biofloc A',
      location: 'North',
      ph: 7.6,
      nh3: 0,
      dissolvedOxygen: 0,
      status: PondHealthStatus.poor,
    ),
  ];

  static const List<WaterMetric> waterMetrics = [
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
      value: '6.8 mg/L',
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
      value: '2.40 L',
      valueIsHealthy: false,
    ),
  ];

  static const List<String> pondSelectors = [
    'Pond A - North',
    'Pond B - East',
    'Pond C - South',
  ];
}
