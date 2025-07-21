import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRoutesName.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, PageRoutesName.login);
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.appLogoIcn, height: 185)),
    );
  }
}
