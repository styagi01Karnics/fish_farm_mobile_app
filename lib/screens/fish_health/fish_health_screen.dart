import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/fish_health_mock_data.dart';
import '../../models/fish_species.dart';
import '../../theme/app_colors.dart';
import '../../widgets/fish_species_card.dart';
import '../../widgets/screen_header.dart';
import '../../widgets/segment_toggle.dart';

class FishHealthScreen extends StatefulWidget {
  const FishHealthScreen({super.key});

  @override
  State<FishHealthScreen> createState() => _FishHealthScreenState();
}

class _FishHealthScreenState extends State<FishHealthScreen> {
  int _segmentIndex = 0;
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<FishSpecies> get _filteredSpecies => FishHealthMockData.search(_query);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeader(
            title: 'Fish Health Monitor',
            subtitle: 'Track symptoms and prevent diseases',
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
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Search fish.',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFFA1A1A1),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _query.trim().isEmpty
                  ? FishHealthMockData.speciesCountLabel
                  : '${_filteredSpecies.length} species',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textHeading,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredSpecies.length,
              itemBuilder: (context, index) {
                final species = _filteredSpecies[index];
                return FishSpeciesCard(
                  species: species,
                  onTap: () => context.push('/fish-detail/${species.id}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
