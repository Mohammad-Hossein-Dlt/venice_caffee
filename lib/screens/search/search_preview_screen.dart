import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/search/search_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/horizontal_card.dart';
import 'package:venice_caffee/widgets/vertical_card.dart';

class SearchPreviewScreen extends StatefulWidget {
  const SearchPreviewScreen({super.key});

  @override
  State<SearchPreviewScreen> createState() => _SearchPreviewScreenState();
}

class _SearchPreviewScreenState extends State<SearchPreviewScreen> {
  bool isDarkMode_ = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "بهترین کافه رو پیدا کن",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkMode_ ? darkGray : gray100,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "جستجو کن",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: lightGray,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Iconsax.search_normal,
                          color: lightGray,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              horizontalList(),
              const SizedBox(height: 20),
              verticalList(),
            ],
          ),
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
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                "مکان های پرطرفدار",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                "مکان های موردعلاقه",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
}
