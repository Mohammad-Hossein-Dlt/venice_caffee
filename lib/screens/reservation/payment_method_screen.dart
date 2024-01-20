import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/reservation/finish_reservation.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class ReservationPaymentMethodScreen extends StatefulWidget {
  const ReservationPaymentMethodScreen({super.key});

  @override
  State<ReservationPaymentMethodScreen> createState() =>
      _ReservationPaymentMethodScreenState();
}

class _ReservationPaymentMethodScreenState
    extends State<ReservationPaymentMethodScreen> {
  bool isDarkMode_ = false;

  String paymentMethod = "inPlace";
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              title: const Text(
                "رزرو",
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
          ],
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                PersianNumber(
                                  number: "3/3",
                                  style: TextStyle(
                                    color:
                                        isDarkMode_ ? lightGray : primaryBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  "مرحله",
                                  style: TextStyle(
                                    color: lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "اطلاعات صورتحساب",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "شیوه ی پرداخت خود را انتخاب کنید",
                                  style: TextStyle(
                                    color: darkGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      paymentMethodItem(
                        title: "درب منزل",
                        subTitle: "پرداخت نقد یا توسط کارت هنگام تحویل سفارش",
                        icon: const Icon(
                          Iconsax.money,
                          color: green600,
                        ),
                        method: "inPlace",
                      ),
                      paymentMethodItem(
                        title: "آنلاین",
                        subTitle: "پرداخت توسط کارت بانکی بصورت آنلاین",
                        icon: const Icon(
                          Iconsax.card_pos,
                          color: green600,
                        ),
                        method: "online",
                      ),
                      paymentMethodItem(
                        title: "کیف پول",
                        subTitle: "پرداخت از طریق کیف پول",
                        icon: const Icon(
                          Iconsax.wallet,
                          color: green600,
                        ),
                        method: "wallet",
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 102,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isDarkMode_ ? secondaryBlack : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBrown,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        maximumSize: const Size(double.infinity, 52),
                        minimumSize: const Size(double.infinity, 52),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const FinishReservationScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "بعدی",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentMethodItem(
      {required String title,
      required String subTitle,
      required Widget icon,
      required String method}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isDarkMode_ ? secondaryBlack : gray200,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDarkMode_ ? white : brown700,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subTitle,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          icon,
          IconButton(
            onPressed: () {
              setState(() {
                paymentMethod = method;
              });
            },
            icon: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: isDarkMode_ ? white : brown700, width: 2),
              ),
              child: Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: method == paymentMethod
                        ? isDarkMode_
                            ? white
                            : brown700
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
