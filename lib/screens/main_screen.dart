import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/gift/gift_screen.dart';
import 'package:venice_caffee/screens/home_screen.dart';
import 'package:venice_caffee/screens/profile/profile_screen.dart';
import 'package:venice_caffee/screens/search/search_preview_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

class MainScreenNavigationBar extends StatefulWidget {
  const MainScreenNavigationBar({super.key});

  @override
  State<MainScreenNavigationBar> createState() =>
      _MainScreenNavigationBarState();
}

class _MainScreenNavigationBarState extends State<MainScreenNavigationBar> {
  bool isDarkMode_ = false;

  int curentIndex = 3;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: curentIndex,
        elevation: 2,
        onTap: (index) {
          setState(() {
            curentIndex = index;
          });
        },
        selectedFontSize: 12,
        selectedItemColor: primaryBrown,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 12,
        unselectedItemColor: lightGray,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Iconsax.profile_2user,
              color: lightGray,
            ),
            activeIcon: Icon(
              Iconsax.profile_2user5,
              color: isDarkMode_ ? brown200 : primaryBrown,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Iconsax.gift,
              color: lightGray,
            ),
            activeIcon: Icon(
              Iconsax.gift5,
              color: isDarkMode_ ? brown200 : primaryBrown,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Iconsax.coffee,
              color: lightGray,
            ),
            activeIcon: Icon(
              Iconsax.coffee5,
              color: isDarkMode_ ? brown200 : primaryBrown,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Iconsax.home_25,
              color: lightGray,
            ),
            activeIcon: Icon(
              Iconsax.home_25,
              color: isDarkMode_ ? brown200 : primaryBrown,
            ),
            label: "",
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          IndexedStack(
            index: curentIndex,
            children: const [
              ProfileScreen(),
              GiftScreen(),
              SearchPreviewScreen(),
              HomeScreen(),
            ],
          ),
        ]),
      ),
    );
  }
}
