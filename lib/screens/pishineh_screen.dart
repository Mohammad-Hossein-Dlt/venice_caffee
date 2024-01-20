import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

enum TransactionType { recharge, reservation, byu }

class PishinehScreen extends StatefulWidget {
  const PishinehScreen({super.key});

  @override
  State<PishinehScreen> createState() => _PishinehScreenState();
}

class _PishinehScreenState extends State<PishinehScreen> {
  bool isDarkMode_ = false;

  Map<String, List<Map<String, String>>> transactionsData = {
    "recentActivity": [
      {
        "title": "شناسه شارژ 101292",
        "cost": "30- تومان",
        "description":
            "تبریک میگم ؛ شما با موفقیت کیف پول خود را شارژ کردید.\nشناسه پرداخت : 101292",
        "date": "22 مهر 1401 ، ساعت 16:00",
        "type": "recharge",
        "image": "",
      },
      {
        "title": "خرید موکاچینو",
        "cost": "15- تومان",
        "description":
            "تبریک میگم ؛ شما 15 تومان تخفیف در این خرید دریافت کردید.",
        "date": "18 دی 1402 ، ساعت 20:00",
        "type": "buy",
        "image": "assets/images/mocachino.png"
      },
    ],
    "15 اردیبهشت 1402": [
      {
        "title": "خرید کمکس",
        "cost": "75- تومان",
        "description": "تبریک میگم ؛ شما با موفقیت  سفارش خود را پرداخت کردید.",
        "date": "15 اردیبهشت 1402 ، ساعت 20:00",
        "type": "buy",
        "image": "assets/images/chemex.png"
      },
      {
        "title": "رزرو میز",
        "cost": "50- تومان",
        "description":
            "تبریک میگم ؛ شما با موفقیت  یک میز 4 نفره برای ساعت 18 روز 16 اردیبهشت 1402 رزرو کردید.",
        "date": "15 اردیبهشت 1402 ، ساعت 23:00",
        "type": "reservation",
        "image": "",
      },
      {
        "title": "شارژ کیف پول",
        "cost": "350+ تومان",
        "description":
            "تبریک میگم ؛ شما با موفقیت حساب خود را به مبلغ 350 تومان شارژ کردید.",
        "date": "15 اردیبهشت 1402 ، ساعت 23:05",
        "type": "recharge",
        "image": "",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "پیشینه",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.menu,
          ),
        ),
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
              ...transactionsData.keys.toList().map(
                (e) {
                  return transactions(
                      title: e, data: transactionsData[e] ?? []);
                },
              ),
              // transactions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactions(
      {required String title, required List<Map<String, String>> data}) {
    return Column(
      children: [
        if (title == "recentActivity")
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "فعالیت های اخیر",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        else
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isDarkMode_ ? secondaryBlack : brown100,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: isDarkMode_ ? white : brown900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ...data.map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: isDarkMode_ ? secondaryBlack : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e["cost"] ?? "",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: lightGray,
                                ),
                              ),
                              Text(
                                e["title"] ?? "",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            e["description"] ?? "",
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            e["date"] ?? "",
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                color: lightGray,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        if (e["type"] == "buy")
                          Image.asset(
                            e["image"] ?? "",
                            width: 40,
                            height: 40,
                          ),
                        if (e["type"] == "recharge")
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: green600,
                            ),
                            child: const Center(
                              child: Icon(
                                Iconsax.money_recive,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        if (e["type"] == "reservation")
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: red500,
                            ),
                            child: const Center(
                              child: Icon(
                                Iconsax.money_send,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
