import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/profile/account_screen.dart';
import 'package:venice_caffee/screens/profile/notification_settings.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/utils/theme/theme_entities.dart';
import 'package:venice_caffee/utils/theme/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode_ = false;

  Map userData = {
    "userFullName": "محمدحسین دولت آبادی",
    "userProfileImage": "assets/images/profile.png",
  };
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (isDarkMode_) {
              Provider.of<ThemeProvider>(context, listen: false).setTheme =
                  ThemeEntities.light;
            } else {
              Provider.of<ThemeProvider>(context, listen: false).setTheme =
                  ThemeEntities.dark;
            }
          },
          icon: Icon(
            isDarkMode_ ? Iconsax.moon5 : Iconsax.sun_15,
            color: isDarkMode_ ? brown400 : brown300,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ونیز",
                  style: TextStyle(
                    color: isDarkMode_ ? white : brown800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "کافه",
                  style: TextStyle(
                    color: isDarkMode_ ? brown200 : brown100,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          userData["userProfileImage"],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          userData["userFullName"],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode_ ? primaryBrown : gray100,
                          padding: EdgeInsets.zero,
                          elevation: 2,
                          shadowColor: Theme.of(context).colorScheme.shadow,
                          maximumSize: const Size(42, 30),
                          minimumSize: const Size(42, 30),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          side: BorderSide(
                              color:
                                  isDarkMode_ ? secondaryBrown : Colors.white,
                              width: 2),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Icon(
                            Icons.edit_square,
                            size: 24,
                            color: isDarkMode_ ? brown100 : primaryBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  item(
                    title: "حساب کاربری",
                    subTitle: "مدیریت و امنیت حساب کاربری",
                    icon: const Icon(
                      Iconsax.profile_2user,
                      size: 24,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  item(
                    title: "اعلان ها",
                    subTitle: "تنطیمات اعلان ها",
                    icon: const Icon(
                      Iconsax.notification,
                      size: 24,
                    ),
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationsSettings(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  item(
                    title: "پرداخت ها",
                    subTitle: "مدیریت و امنیت پرداخت ها",
                    icon: const Icon(
                      Iconsax.card,
                      size: 24,
                    ),
                    function: () {},
                  ),
                  const Divider(),
                  item(
                    title: "علاقه مندی ها",
                    subTitle: "مشاهده ی علاقه مندی ها",
                    icon: const Icon(
                      Iconsax.heart,
                      size: 24,
                    ),
                    function: () {},
                  ),
                  const Divider(),
                  item(
                    title: "قوانین و مقررات",
                    subTitle: "قوانین و مقررات استفاده از برنامه",
                    icon: const Icon(
                      Iconsax.shield_tick,
                      size: 24,
                    ),
                    function: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item({
    required String title,
    String? subTitle,
    required Widget icon,
    required Function() function,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: () {
                function();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                subTitle != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            subTitle,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              color: lightGray,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: icon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
