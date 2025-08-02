import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text(
        "Profile View",
        style: theme.textTheme.headlineLarge?.copyWith(
          color: ColorPallete.primaryColor,
        ),
      ),
    );
  }
}
