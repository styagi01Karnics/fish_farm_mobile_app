import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_bottom_nav.dart';
import '../fish_health/fish_health_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../water_data/water_data_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.location,
    required this.child,
  });

  final String location;
  final Widget child;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  AppTab get _currentTab {
    if (widget.location.startsWith('/water-data')) return AppTab.waterData;
    if (widget.location.startsWith('/fish-health')) return AppTab.fishHealth;
    if (widget.location.startsWith('/profile')) return AppTab.profile;
    return AppTab.home;
  }

  void _onTabSelected(AppTab tab) {
    final path = switch (tab) {
      AppTab.home => '/home',
      AppTab.waterData => '/water-data',
      AppTab.fishHealth => '/fish-health',
      AppTab.profile => '/profile',
    };
    if (GoRouterState.of(context).uri.path != path) {
      context.go(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: widget.child,
      bottomNavigationBar: AppBottomNav(
        currentTab: _currentTab,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}

/// Routes that use the bottom navigation shell.
Widget shellChildForPath(String path) {
  if (path.startsWith('/water-data')) {
    return const WaterDataScreen();
  }
  if (path.startsWith('/fish-health')) {
    return const FishHealthScreen();
  }
  if (path.startsWith('/profile')) {
    return const ProfileScreen();
  }
  return const HomeScreen();
}
