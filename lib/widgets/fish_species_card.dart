import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/fish_species.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';
import 'fish_species_image.dart';
import 'tag_chip.dart';

class FishSpeciesCard extends StatelessWidget {
  const FishSpeciesCard({
    super.key,
    required this.species,
    required this.onTap,
  });

  final FishSpecies species;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: AppCard(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FishSpeciesImage(
                    imageAsset: species.imageAsset,
                    width: 44,
                    height: 44,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          species.name,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          species.scientificName,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HealthLevelBadge(
                    label: species.health.label,
                    color: species.health.color,
                    background: species.health.background,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: species.tags.map((t) => TagChip(label: t)).toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _WaterParam(
                    icon: Icons.water_drop_outlined,
                    label: 'pH',
                    value: species.waterRange.ph,
                  ),
                  const SizedBox(width: 16),
                  _WaterParam(
                    icon: Icons.thermostat_outlined,
                    label: 'Temp.',
                    value: species.waterRange.temperature,
                  ),
                  const SizedBox(width: 16),
                  _WaterParam(
                    icon: Icons.water_drop_outlined,
                    label: 'DO',
                    value: species.waterRange.dissolvedOxygen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WaterParam extends StatelessWidget {
  const _WaterParam({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
