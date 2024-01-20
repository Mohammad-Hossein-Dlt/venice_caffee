import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/reservation/payment_method_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({super.key});

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  bool isDarkMode_ = false;

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
                bottom: 100,
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
                                  number: "3/2",
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
                                      fontSize: 16),
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
                                  "تاریخ رزرو خود را مشخص کنید",
                                  style: TextStyle(
                                      color: darkGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: isDarkMode_ ? secondaryBlack : gray200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "تعداد مهمان ها",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: lightGray,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Iconsax.arrow_down_1,
                                          color: lightGray,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: "",
                                        elevation: 0,
                                        hint: const Text(
                                          "تعداد مهمان ها",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: lightGray,
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        items: []
                                            .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: SizedBox(
                                                  width: 116,
                                                  child: Text(
                                                    e,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            // category = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "زمان",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: lightGray,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Iconsax.arrow_down_1,
                                          color: lightGray,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: "",
                                        elevation: 0,
                                        hint: const Text(
                                          "انتخاب زمان رزرو",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: lightGray,
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        items: []
                                            .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: SizedBox(
                                                  width: 116,
                                                  child: Text(
                                                    e,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            // category = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "شماره میز",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: lightGray,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Iconsax.arrow_down_1,
                                          color: lightGray,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: "",
                                        elevation: 0,
                                        hint: const Text(
                                          "انتخاب شماره میز",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: lightGray,
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        items: []
                                            .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: SizedBox(
                                                  width: 116,
                                                  child: Text(
                                                    e,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            // category = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "ساعت",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: lightGray,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Iconsax.arrow_down_1,
                                          color: lightGray,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: "",
                                        elevation: 0,
                                        hint: const Text(
                                          "انتخاب ساعت رزرو",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: lightGray,
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        items: []
                                            .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: SizedBox(
                                                  width: 116,
                                                  child: Text(
                                                    e,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            // category = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
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
                                const ReservationPaymentMethodScreen(),
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
}
