import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDarkMode_ = false;

  List preSearchedList = [
    "کافه سولر",
    "کافه سولر",
    "کافه سولر",
  ];

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جستجو",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBrown,
                elevation: 0,
                padding: EdgeInsets.zero,
                maximumSize: const Size(34, 34),
                minimumSize: const Size(34, 34),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Center(
                child: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              TextField(
                textDirection: TextDirection.rtl,
                autofocus: true,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: brown400, width: 1.4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                          color: isDarkMode_ ? darkGray : gray100, width: 1)),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                  hintText: "جستجو کن...",
                  hintStyle: const TextStyle(
                      color: lightGray,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  suffixIcon: const Icon(
                    Iconsax.search_normal,
                    color: lightGray,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              preSearched(),
            ],
          ),
        ),
      ),
    );
  }

  Widget preSearched() {
    return Column(
      children: [
        ...preSearchedList.map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.close_circle,
                  color: lightGray,
                  size: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    e,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: lightGray,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Iconsax.clock,
                    color: lightGray,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
