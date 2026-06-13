import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/fish_species.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';
import 'fish_species_image.dart';
import 'tag_chip.dart';

class FishDetailHeader extends StatelessWidget {
  const FishDetailHeader({super.key, required this.species});

  final FishSpecies species;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FishSpeciesImage(
                imageAsset: species.detailImage,
                width: 81,
                height: 44,
                borderRadius: 3,
                detail: true,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            species.name,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        HealthLevelBadge(
                          label: species.health.label,
                          color: species.health.color,
                          background: species.health.background,
                        ),
                      ],
                    ),
                    Text(
                      species.scientificName,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: species.tags.map((t) => TagChip(label: t)).toList(),
          ),
        ],
      ),
    );
  }
}
