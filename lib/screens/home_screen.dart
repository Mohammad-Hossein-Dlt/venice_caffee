import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/pishineh_screen.dart';
import 'package:venice_caffee/screens/recharge_wallet_screen.dart';
import 'package:venice_caffee/screens/shopping_basket_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/dash_separator.dart';
import 'package:venice_caffee/widgets/horizontal_card.dart';
import 'package:venice_caffee/widgets/vertical_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode_ = false;
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            dashboard(),
            const SizedBox(height: 10),
            score(),
            const SizedBox(height: 10),
            horizontalList(),
            const SizedBox(height: 10),
            verticalList(),
          ],
        ),
      ),
    );
  }

  Widget verticalList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "مشاهده همه",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDarkMode_ ? blue400 : blue600,
                  ),
                ),
              ),
              const Text(
                "مکان های محبوب",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const HorizontalCard(
            image: "assets/images/coffee_shope_2.png",
            title: "کافه تیکو - خیابان فرشته",
            description: "کافه تیکو در خیابان فرشته یکی از بهترین...",
            score: 4),
        const HorizontalCard(
            image: "assets/images/coffee_shope_2.png",
            title: "کافه تیکو - خیابان فرشته",
            description: "کافه تیکو در خیابان فرشته یکی از بهترین...",
            score: 4),
        const HorizontalCard(
            image: "assets/images/coffee_shope_2.png",
            title: "کافه تیکو - خیابان فرشته",
            description: "کافه تیکو در خیابان فرشته یکی از بهترین...",
            score: 4),
        const HorizontalCard(
            image: "assets/images/coffee_shope_2.png",
            title: "کافه تیکو - خیابان فرشته",
            description: "کافه تیکو در خیابان فرشته یکی از بهترین...",
            score: 4),
      ],
    );
  }

  Widget horizontalList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "مشاهده همه",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDarkMode_ ? blue400 : blue600,
                  ),
                ),
              ),
              const Text(
                "مکان های موردعلاقه",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              SizedBox(width: 10),
              VerticalCard(
                  image: "assets/images/coffee_shope_1.png",
                  title: "کافه ونیز",
                  score: "4",
                  location: "ولیعصر - تهران",
                  distance: "۱۱ کیلومتر",
                  longTime: "۱۵  دقیقه"),
              VerticalCard(
                  image: "assets/images/coffee_shope_1.png",
                  title: "کافه ونیز",
                  score: "4",
                  location: "ولیعصر - تهران",
                  distance: "۱۱ کیلومتر",
                  longTime: "۱۵  دقیقه"),
              VerticalCard(
                  image: "assets/images/coffee_shope_1.png",
                  title: "کافه ونیز",
                  score: "4",
                  location: "ولیعصر - تهران",
                  distance: "۱۱ کیلومتر",
                  longTime: "۱۵  دقیقه"),
              VerticalCard(
                  image: "assets/images/coffee_shope_1.png",
                  title: "کافه ونیز",
                  score: "4",
                  location: "ولیعصر - تهران",
                  distance: "۱۱ کیلومتر",
                  longTime: "۱۵  دقیقه"),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget score() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "مشاهده همه",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDarkMode_ ? blue400 : blue600,
                  ),
                ),
              ),
              const Text(
                "امتیازات من",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            elevation: 2,
            shadowColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              width: double.infinity,
              height: 88,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "۱۰/۸",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "۱ قهوه رایگان",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Text(
                          "۱۰ تا قهوه بخر ، یکی مهمون ما باش",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: lightGray, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          animation: true,
                          lineHeight: 4,
                          // fillColor: light200,
                          progressColor: isDarkMode_ ? brown100 : primaryBrown,
                          backgroundColor: isDarkMode_ ? darkGray : gray200,
                          isRTL: true,
                          percent: 0.8,
                          trailing: null,
                          leading: null,
                          center: null,
                          widgetIndicator: null,
                          barRadius: const Radius.circular(4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/images/coffee_mug_with_background.png",
                    width: 48,
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dashboard() {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        // height: 284,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          // color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "! سلام",
                      style: TextStyle(
                        color: lightGray,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "محمدحسین دولت آبادی",
                      style: TextStyle(
                        color: isDarkMode_ ? white : primaryBrown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/images/profile.png",
                  width: 45,
                  height: 45,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 328,
              height: 74,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: isDarkMode_ ? brown400 : primaryBrown,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 40,
                    child: Image.asset(
                      "assets/images/order_pay_box_effect.png",
                      width: 192,
                      // height: ,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: isDarkMode_
                                ? secondaryBrown
                                : white.withOpacity(0.4),
                            side: BorderSide(color: white.withOpacity(0.06)),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "بیشتر",
                            style: TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "جمع سفارش های شما",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: white.withOpacity(0.6),
                              ),
                            ),
                            const Text(
                              "۴۲۶.۰۰۰ تومان",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DashSeparator(color: brown200),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PishinehScreen(),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      const Icon(
                        Iconsax.clock,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "پیشینه",
                        style: TextStyle(
                          color: isDarkMode_ ? lightGray : primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShoppingBasketScreen(),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      const Icon(
                        Iconsax.bag_happy,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "سبد خرید",
                        style: TextStyle(
                          color: isDarkMode_ ? lightGray : primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [
                      const Icon(
                        Iconsax.wallet_check,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "تکمیل شده",
                        style: TextStyle(
                          color: isDarkMode_ ? lightGray : primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RechargeWalletScreen(),
                      ),
                    );
                  },
                  icon: Column(
                    children: [
                      const Icon(
                        Iconsax.wallet_add,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "شارژ حساب",
                        style: TextStyle(
                          color: isDarkMode_ ? lightGray : primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
