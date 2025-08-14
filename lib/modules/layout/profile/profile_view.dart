import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/modules/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> _languages = ["English", "عربي"];
  final List<String> _themes = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65.0)),
          ),
          child: Row(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(1000.0),
                    bottomLeft: Radius.circular(1000.0),
                    bottomRight: Radius.circular(1000.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.routeLogo),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hossam Bakry",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Flutter Developer",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            localization.language,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomDropdown<String>(
            items: _languages,
            initialItem: provider.currentLanguage == "en" ? "English" : "عربي",
            onChanged: (value) {
              provider.changeLanguage(value! == "English" ? "en" : "ar");
            },
            decoration: CustomDropdownDecoration(
              closedBorder: Border.all(color: theme.primaryColor),
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 30,
                color: theme.primaryColor,
              ),
              closedFillColor: Colors.transparent,
              headerStyle: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            localization.theme_mode,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomDropdown<String>(
            hintText: 'Select job role',
            items: _themes,
            initialItem: provider.isDark() ? "Dark" : "Light",
            onChanged: (value) {
              log('changing value to: $value');
              provider.changeTheme(
                value! == "Light" ? ThemeMode.light : ThemeMode.dark,
              );
            },
            decoration: CustomDropdownDecoration(
              closedBorder: Border.all(color: theme.primaryColor),
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 30,
                color: theme.primaryColor,
              ),
              closedFillColor: Colors.transparent,
              headerStyle: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
