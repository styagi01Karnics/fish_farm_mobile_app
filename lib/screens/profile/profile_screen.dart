import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_card.dart';
import '../../widgets/screen_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeader(
            title: 'My Profile',
            subtitle: 'Manage your farm and account settings',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryLight,
                    child: Text(
                      MockData.userName[0],
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    MockData.userName,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ..._menuItems.map(
                    (item) => _ProfileMenuTile(
                      item: item,
                      onTap: item.route != null
                          ? () => context.push(item.route!)
                          : item.isLogout
                              ? () => context.go('/login')
                              : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem {
  const _ProfileMenuItem({
    required this.title,
    required this.icon,
    this.route,
    this.isLogout = false,
  });

  final String title;
  final IconData icon;
  final String? route;
  final bool isLogout;
}

const _menuItems = [
  _ProfileMenuItem(title: 'Edit Profile', icon: Icons.person_outline),
  _ProfileMenuItem(title: 'Pond Settings', icon: Icons.settings_outlined),
  _ProfileMenuItem(
    title: 'Notifications',
    icon: Icons.notifications_outlined,
    route: '/notifications',
  ),
  _ProfileMenuItem(
    title: 'Account & Security',
    icon: Icons.shield_outlined,
  ),
  _ProfileMenuItem(title: 'App Language', icon: Icons.language_outlined),
  _ProfileMenuItem(
    title: 'Reports',
    icon: Icons.description_outlined,
    route: '/reports',
  ),
  _ProfileMenuItem(
    title: 'Camera Feed',
    icon: Icons.videocam_outlined,
    route: '/camera',
  ),
  _ProfileMenuItem(
    title: 'Activity Log',
    icon: Icons.history,
    route: '/activity',
  ),
  _ProfileMenuItem(
    title: 'Help and Support',
    icon: Icons.help_outline,
  ),
  _ProfileMenuItem(
    title: 'Log out',
    icon: Icons.logout,
    isLogout: true,
  ),
];

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({required this.item, this.onTap});

  final _ProfileMenuItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textColor =
        item.isLogout ? AppColors.statusPoor : AppColors.textPrimary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.separator)),
          ),
          child: Row(
            children: [
              Icon(item.icon, size: 22, color: AppColors.textHeading),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              if (!item.isLogout)
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
