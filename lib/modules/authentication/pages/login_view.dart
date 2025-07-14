import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Image.asset(AppAssets.appLogoIcn, height: 185)],
      ),
    );
  }
}
