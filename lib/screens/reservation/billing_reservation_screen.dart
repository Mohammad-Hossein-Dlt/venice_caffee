import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/reservation/reservation_details_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class BillingReservationScreen extends StatefulWidget {
  const BillingReservationScreen({super.key});

  @override
  State<BillingReservationScreen> createState() =>
      _BillingReservationScreenState();
}

class _BillingReservationScreenState extends State<BillingReservationScreen> {
  bool isDarkMode_ = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                  number: "3/1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color:
                                        isDarkMode_ ? lightGray : primaryBlack,
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
                                  "اطلاعات صورتحساب خود را وارد کنید",
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
                        child: const Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "نام",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  textDirection: TextDirection.rtl,
                                  maxLines: 1,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: brown400, width: 1.4)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: lightGray, width: 1)),
                                    hintTextDirection: TextDirection.rtl,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    hintText: "نام خود را وارد کنید",
                                    hintStyle: TextStyle(
                                        color: lightGray,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "شماره همراه",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1,
                                  minLines: 1,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: brown400, width: 1.4)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: lightGray, width: 1)),
                                    hintTextDirection: TextDirection.rtl,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    hintText: "...09",
                                    hintStyle: TextStyle(
                                        color: lightGray,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "نشانی",
                                  style: TextStyle(
                                      color: lightGray,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  textDirection: TextDirection.rtl,
                                  maxLines: 1,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: brown400, width: 1.4)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                            color: lightGray, width: 1)),
                                    hintTextDirection: TextDirection.rtl,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    hintText: "نشانی خود را وارد کنید",
                                    hintStyle: TextStyle(
                                        color: lightGray,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
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
                                const ReservationDetailsScreen(),
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
