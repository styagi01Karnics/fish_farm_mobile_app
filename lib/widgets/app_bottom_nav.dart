import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

enum AppTab { home, waterData, fishHealth, profile }

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final AppTab currentTab;
  final ValueChanged<AppTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x260145CC),
            blurRadius: 6,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                selected: currentTab == AppTab.home,
                onTap: () => onTabSelected(AppTab.home),
              ),
              _NavItem(
                icon: Icons.water_drop_outlined,
                label: 'Water Data',
                selected: currentTab == AppTab.waterData,
                onTap: () => onTabSelected(AppTab.waterData),
              ),
              _NavItem(
                icon: Icons.set_meal_outlined,
                label: 'Fish Health',
                selected: currentTab == AppTab.fishHealth,
                onTap: () => onTabSelected(AppTab.fishHealth),
              ),
              _NavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                selected: currentTab == AppTab.profile,
                onTap: () => onTabSelected(AppTab.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textHeading;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
