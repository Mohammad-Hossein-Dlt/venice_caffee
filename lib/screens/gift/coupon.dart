import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenScreenState();
}

class _CouponScreenScreenState extends State<CouponScreen> {
  Map coupon = {
    "title": "",
    "subtitle": "",
    "description": [
      "کوپن ها فقط در شعبات شهر تهران قابل استفاده میباشد.",
      "هر کوپن را فقط یکبار میتوان استفاده کرد.",
      "کوپن ها را فقط از ساعت 7 صبح تا 23 میتوان استفاده نمود.",
      "کوپن ها فقط در روش پرداخت با کیف پول و coffee pay قابل استفاده هستند.",
    ],
  };
  @override
  Widget build(BuildContext context) {
    List description = coupon["description"];
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              title: const Text(
                "کوپن",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    const PersianNumber(
                      number: "% 25 تخفیف برای تمامی منوها",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: PersianNumber(
                            number: "مهلت استفاده تا فردا ساعت 22",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: lightGray,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Iconsax.clock,
                          color: lightGray,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: gray100),
                    const SizedBox(height: 20),
                    ...description.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: PersianNumber(
                          number: "${description.indexOf(e) + 1}. $e",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBrown,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      maximumSize: const Size(double.infinity, 52),
                      minimumSize: const Size(double.infinity, 52),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'استفاده از کوپن',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
