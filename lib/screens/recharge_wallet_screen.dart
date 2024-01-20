import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/wallet_charge_payment_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class RechargeWalletScreen extends StatefulWidget {
  const RechargeWalletScreen({super.key});

  @override
  State<RechargeWalletScreen> createState() => _RechargeWalletScreenState();
}

class _RechargeWalletScreenState extends State<RechargeWalletScreen> {
  bool isDarkMode_ = false;

  List<String> priceItems = [
    "40",
    "60",
    "80",
    "100",
    "150",
    "200",
  ];

  ValueNotifier<String> curentPriceItem = ValueNotifier<String>("");
  TextEditingController desiredPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              title: const Text(
                "شارژ کیف پول",
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "رقم خود را انتخاب کنید",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        textDirection: TextDirection.rtl,
                        children: [
                          ...priceItems.map((e) => moneyItem(e)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "یا رقم دلخواه خود را وارد کنید",
                        style: TextStyle(
                          color: lightGray,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: desiredPrice,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        minLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide:
                                  BorderSide(color: brown400, width: 1.4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  color: isDarkMode_ ? darkGray : gray100,
                                  width: 1)),
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          hintText: "حداقل مبلغ 40 تومان ",
                          hintStyle: const TextStyle(
                              color: gray200,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
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
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => WalletChargePaymentScreen(
                                priceItems: priceItems,
                                selectedPriceItem: curentPriceItem,
                                desiredPrice: desiredPrice),
                          ),
                        )
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: const Text(
                        "سفارش بده",
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

  Widget moneyItem(String price) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        maximumSize: const Size(102, 44),
        minimumSize: const Size(102, 44),
        backgroundColor: price == curentPriceItem.value
            ? brown400
            : isDarkMode_
                ? secondaryBlack
                : gray100,
        side: BorderSide(
          color: price == curentPriceItem.value
              ? Colors.transparent
              : isDarkMode_
                  ? Colors.transparent
                  : gray200,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          curentPriceItem.value = price;
        });
      },
      child: PersianNumber(
        number: "$price ت",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: price == curentPriceItem.value
              ? white
              : isDarkMode_
                  ? white
                  : primaryBlack,
        ),
      ),
    );
  }
}
