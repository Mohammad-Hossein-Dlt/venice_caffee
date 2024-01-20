import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/gift/coupon.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  bool isDarkMode_ = false;
  List<Map<String, dynamic>> couponsList = [
    {
      "title": "%۲۵ تخفیف برای تمامی منوها",
      "subTitle": "%۲۵ تخفیف برای تمامی منو ها تا",
      "expDate": "۱۵ اردیبهشت ۱۴۰۲ ",
    },
  ];

  List<Map<String, dynamic>> missionsList = [
    {
      "title": "5 عدد قهوه بخر",
      "subTitle": "% 25 تخفیف بگیر",
      "expDate": "12 ساعت تا اتمام",
      "total": "",
      "progress": "",
      "type": "buy",
    },
    {
      "title": "1 ساعت وقت بگذرون",
      "subTitle": "وقت بگذرون و قهوه بخور",
      "expDate": "12 ساعت تا اتمام",
      "total": "60",
      "progress": "45",
      "type": "hangOut",
    },
  ];
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              const Text(
                "هدیه ای جذاب برای تو",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "ماموریت ها رو انجام بده و از جاییزه هات لذت ببر",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: lightGray,
                ),
              ),
              const SizedBox(height: 20),
              gift(title: "۲۸ امتیاز تا دریافت هدیه", percent: 80),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxItem(
                      title: "ماموریت ها",
                      subTitle: "5 عدد در حال انجام",
                      number: 11),
                  boxItem(
                      title: "کوپن تخفیف",
                      subTitle: "5 عدد منقضی شده",
                      number: 11),
                ],
              ),
              const SizedBox(height: 20),
              coupon(),
              const SizedBox(height: 10),
              missions(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget gift({
    required String title,
    String? subTitle,
    required int percent,
  }) {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            const Icon(
              Iconsax.arrow_left_2,
              color: lightGray,
              size: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Text(
                      subTitle ?? "",
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: lightGray,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: true,
                    lineHeight: 6,
                    progressColor: primaryBrown,
                    backgroundColor: gray200,
                    isRTL: true,
                    percent: percent / 100,
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
              "assets/images/gift.png",
              width: 44,
              height: 44,
            ),
          ],
        ),
      ),
    );
  }

  Widget boxItem({
    required String title,
    required String subTitle,
    required int number,
  }) {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        width: 150,
        height: 116,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Iconsax.arrow_left_2,
                  color: lightGray,
                  size: 24,
                ),
                Expanded(
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode_ ? Colors.white : primaryBlack,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PersianNumber(
                number: number.toString(),
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Text(
              subTitle,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget coupon() {
    return Column(
      children: [
        Row(
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ...couponsList.map(
          (e) => horizontalItem(
              itemData: e,
              image: "assets/images/coupon.png",
              indicator: false,
              function: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CouponScreen(),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget missions() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TextButton(
            //   onPressed: () {},
            //   child: const Text(
            //     "مشاهده همه",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       color: informationLight600,
            //     ),
            //   ),
            // ),
            Text(
              "ماموریت های تو",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...missionsList.map(
          (e) {
            String image = "assets/images/discount.png";

            if (e["type"] == "buy") {
              image = "assets/images/discount.png";
            }
            if (e["type"] == "hangOut") {
              image = "assets/images/hang_out.png";
            }
            return horizontalItem(
              itemData: e,
              image: image,
              indicator: true,
              function: () {},
            );
          },
        ),
      ],
    );
  }

  Widget horizontalItem({
    required Map itemData,
    required String image,
    required bool indicator,
    required Function function,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Theme.of(context).colorScheme.primaryContainer,
        shadowColor: Theme.of(context).colorScheme.shadow,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: () {
              function();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        itemData["title"],
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        itemData["subTitle"],
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: lightGray,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          indicator
                              ? itemData["total"].isNotEmpty &&
                                      (int.parse(itemData["total"]) != 0)
                                  ? Row(
                                      children: [
                                        PersianNumber(
                                          number: " /${itemData["total"]}",
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: primaryBrown,
                                          ),
                                        ),
                                        PersianNumber(
                                          number: "${itemData["progress"]}",
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: lightGray,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                              : const SizedBox(),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: PersianNumber(
                                    number: itemData["expDate"],
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: red500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Iconsax.clock,
                                  color: red500,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  image,
                  width: 44,
                  height: 44,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
