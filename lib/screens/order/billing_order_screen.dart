import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/screens/order/chat_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/address_widget.dart';
import 'package:venice_caffee/widgets/dash_separator.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class BillingOrderScreen extends StatefulWidget {
  const BillingOrderScreen({
    super.key,
    required this.shoppingBasketData,
    required this.factor,
  });
  final List<Map<String, dynamic>> shoppingBasketData;
  final Map<String, dynamic> factor;

  @override
  State<BillingOrderScreen> createState() => _BillingOrderScreenState();
}

class _BillingOrderScreenState extends State<BillingOrderScreen> {
  bool isDarkMode_ = false;

  List<Map<String, dynamic>> shoppingBasketData = [];

  Map<String, dynamic> factor = {
    "totalOrder": "0",
    "shippingCost": "10000",
    "packagingCost": "0",
    "discount": "35000",
  };

  Map<String, dynamic> cafeData = {
    "score": "4",
    "assistantName": "روژان فروزانفر",
    "assistantProfileImage": "assets/images/person4.png",
    "address": "لادن - پ 17",
    "sendersAddress": "نبش جام جم - کافه سولر",
    "recipientAddress": "آفریقا - لادن - پ ۱۷",
    "orderRegistrationDate": "15 اردیبهشت ساعت 52 : 06",
  };

  @override
  void initState() {
    shoppingBasketData = List.of(widget.shoppingBasketData);

    factor = Map.of(widget.factor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    factor["totalOrder"] = shoppingBasketData.fold(
        "0",
        (previousValue, element) =>
            (((double.parse(element["price"])) * element["number"]) +
                    double.parse(previousValue))
                .toInt()
                .toString());
    String totalInvoice = factor.keys.fold("0", (previousValue, element) {
      return element == "discount"
          ? (double.parse(previousValue) - double.parse(factor[element]))
              .toInt()
              .toString()
          : (double.parse(previousValue) + double.parse(factor[element]))
              .toInt()
              .toString();
    });

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [],
          body: Stack(
            children: [
              Positioned.fill(
                bottom: 80,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: PersianNumber(
                          number: cafeData["orderRegistrationDate"],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: isDarkMode_ ? lightGray : darkGray,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "امتیاز دهید",
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: RatingBarIndicator(
                                rating: double.parse(cafeData["score"]),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: yellow500,
                                ),
                                unratedColor: gray200,
                                itemCount: 5,
                                itemSize: 32,
                                direction: Axis.horizontal,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  cafeData["assistantName"],
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                PersianNumber(
                                  number: cafeData["address"],
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: isDarkMode_ ? lightGray : lightGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            cafeData["assistantProfileImage"],
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text(
                        "آدرس مبدا و مقصد",
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      AddressWidget(
                        sendersAddress: cafeData["sendersAddress"],
                        recipientAddress: cafeData["recipientAddress"],
                        showTitle: true,
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text(
                        "لیست خرید",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      shoppingBasket(),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      factorItem(
                        totalOrder: factor["totalOrder"],
                        shippingCost: factor["shippingCost"],
                        packagingCost: factor["packagingCost"],
                        discount: factor["discount"],
                        totalInvoice: totalInvoice,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isDarkMode_ ? secondaryBlack : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
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
                              builder: (context) => const ChatScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "ارتباط با کافه سولر",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shoppingBasket() {
    return Column(
      children: [
        ...widget.shoppingBasketData.map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PersianNumber(
                  number:
                      "${(double.parse(e["price"]) * e["number"]).toInt()} تومان",
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      e["title"] ?? "",
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode_ ? lightGray : darkGray,
                      ),
                    ),
                    const SizedBox(width: 10),
                    PersianNumber(
                      number: "X ${e["number"]}",
                      style: const TextStyle(
                        color: brown300,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget factorItem({
    required String totalOrder,
    required String shippingCost,
    required String packagingCost,
    required String discount,
    required String totalInvoice,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "اطلاعات صورتحساب",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersianNumber(
              number: "${(int.parse(totalOrder) / 1000).toInt().toString()} ت",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const Text(
              "جمع سفارش",
              style: TextStyle(
                fontSize: 16,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const DashSeparator(color: gray200),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersianNumber(
              number:
                  "${(int.parse(shippingCost) / 1000).toInt().toString()} ت",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const Text(
              "هزینه ارسال",
              style: TextStyle(
                fontSize: 16,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersianNumber(
              number: int.parse(packagingCost) != 0
                  ? "${(int.parse(packagingCost) / 1000).toInt().toString()} ت"
                  : "رایگان",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const Text(
              "بسته بندی",
              style: TextStyle(
                fontSize: 16,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersianNumber(
              number: "${(int.parse(discount) / 1000).toInt().toString()}- ت",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const Text(
              "تخفیف",
              style: TextStyle(
                fontSize: 16,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const DashSeparator(color: gray200),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersianNumber(
              number:
                  "${(int.parse(totalInvoice) / 1000).toInt().toString()} ت",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const Text(
              "جمع فاکتور",
              style: TextStyle(
                fontSize: 16,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const DashSeparator(color: gray200),
        const SizedBox(height: 10),
      ],
    );
  }
}
