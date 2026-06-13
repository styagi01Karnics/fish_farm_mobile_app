import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/fish_health/fish_detail_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/placeholder/placeholder_screen.dart';
import '../screens/shell/main_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(
            location: state.uri.path,
            child: shellChildForPath(state.uri.path),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SizedBox.shrink()),
          ),
          GoRoute(
            path: '/water-data',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SizedBox.shrink()),
          ),
          GoRoute(
            path: '/fish-health',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SizedBox.shrink()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SizedBox.shrink()),
          ),
        ],
      ),
      GoRoute(
        path: '/fish-detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return FishDetailScreen(speciesId: id);
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Notifications'),
      ),
      GoRoute(
        path: '/reports',
        builder: (context, state) => const PlaceholderScreen(title: 'Reports'),
      ),
      GoRoute(
        path: '/camera',
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Camera Feed'),
      ),
      GoRoute(
        path: '/activity',
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Activity Log'),
      ),
    ],
    redirect: (context, state) {
      final path = state.uri.path;
      if (path == '/') return '/login';
      return null;
    },
  );
}
