import 'package:bot_toast/bot_toast.dart';
import 'package:event_app_c15_mon/core/routes/app_routes.dart';
import 'package:event_app_c15_mon/core/services/loading_service.dart';
import 'package:event_app_c15_mon/core/theme/app_theme_manager.dart';
import 'package:event_app_c15_mon/firebase_options.dart';
import 'package:event_app_c15_mon/modules/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
  configLoading();
}

// latest Language
// latest Theme
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      themeMode: provider.currentTheme,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
