import 'package:event_app_c15_mon/core/routes/app_routes.dart';
import 'package:event_app_c15_mon/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
