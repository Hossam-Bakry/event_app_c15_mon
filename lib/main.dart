import 'package:bot_toast/bot_toast.dart';
import 'package:event_app_c15_mon/core/routes/app_routes.dart';
import 'package:event_app_c15_mon/core/services/loading_service.dart';
import 'package:event_app_c15_mon/core/theme/app_theme_manager.dart';
import 'package:event_app_c15_mon/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  configLoading();
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
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
