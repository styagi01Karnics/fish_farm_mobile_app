import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const FishingPondMonitorApp());
}

class FishingPondMonitorApp extends StatelessWidget {
  const FishingPondMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fishing Pond Monitor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: createAppRouter(),
    );
  }
}
