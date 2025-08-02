import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'home/home_view.dart';
import 'maps/maps_view.dart';
import 'profile/profile_view.dart';
import 'favorites/favorites_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeView(),
    MapsView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Bounceable(
        onTap: () {
          Navigator.pushNamed(context, PageRoutesName.eventCreation);
        },
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: ColorPallete.primaryColor,
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.homeIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.homeActiveIcn)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.mapsIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.mapsActiveIcn)),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.favoriteIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.favoriteActiveIcn)),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.userIcn)),
            activeIcon: ImageIcon(AssetImage(AppAssets.userActiveIcn)),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
