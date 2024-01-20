import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/order/billing_order_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/address_widget.dart';
import 'package:venice_caffee/widgets/dash_separator.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen(
      {super.key, required this.shoppingBasketData, required this.factor});

  final List<Map<String, dynamic>> shoppingBasketData;
  final Map<String, dynamic> factor;
  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  bool isDarkMode_ = false;

  Map deliveryData = {
    "cafeName": "کافه ونیز - فرشته تهران",
    "deliveryTime": "زمان تحویل 16:45",
    "deliveryStatus": "ارسال شده",
    "delivererName": "مهرداد تیموری",
    "delivererProfileImage": "assets/images/person3.png",
    "delivererCode": "123 / 45678",
    "sendersAddress": "نبش جام جم - کافه سولر",
    "recipientAddress": "آفریقا - لادن - پ ۱۷",
  };

  Map userData = {
    "userFullName": "محمدحسین دولت آبادی",
    "userProfileImage": "assets/images/profile.png",
  };

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollBehavior: null,
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              title: Text(
                "خدمات مشتری",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: isDarkMode_ ? lightGray : darkGray,
                ),
              ),
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
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 40,
                right: 40,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDarkMode_ ? secondaryBlack : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                userData["userProfileImage"],
                                width: 50,
                                height: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    PersianNumber(
                                      number: deliveryData["deliveryTime"],
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    PersianNumber(
                                      number: deliveryData["deliveryStatus"],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color:
                                            isDarkMode_ ? lightGray : darkGray,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Iconsax.profile_2user5,
                                color: lightGray,
                                size: 16,
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: isDarkMode_ ? darkGray : brown100,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scaleX: -1,
                                child: Icon(
                                  Iconsax.truck_time,
                                  color: isDarkMode_ ? brown100 : primaryBrown,
                                  size: 16,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color:
                                        isDarkMode_ ? brown200 : primaryBrown,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  ),
                                ),
                              ),
                              Icon(
                                Iconsax.reserve5,
                                color: isDarkMode_ ? brown100 : primaryBrown,
                                size: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDarkMode_ ? secondaryBlack : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      deliveryData["delivererName"],
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    PersianNumber(
                                      number: deliveryData["delivererCode"],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color:
                                            isDarkMode_ ? lightGray : darkGray,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                deliveryData["delivererProfileImage"],
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: isDarkMode_ ? darkGray : gray100),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Iconsax.messages_35,
                                  color: isDarkMode_ ? blue400 : blue600,
                                  size: 24,
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: isDarkMode_ ? darkGray : gray100),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    PersianNumber(
                                      number: "تماس با راننده",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color:
                                            isDarkMode_ ? lightGray : darkGray,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      Iconsax.call5,
                                      color: isDarkMode_ ? blue400 : blue600,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDarkMode_ ? secondaryBlack : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            deliveryData["cafeName"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Divider(color: gray200),
                          shoppingBasket(),
                          const Divider(color: gray200),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(double.infinity, 40),
                              maximumSize: const Size(double.infinity, 40),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BillingOrderScreen(
                                    shoppingBasketData:
                                        widget.shoppingBasketData,
                                    factor: widget.factor,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Iconsax.arrow_left,
                                    color: isDarkMode_ ? brown100 : brown300),
                                const SizedBox(width: 6),
                                Text(
                                  "مشاهده خلاصه سفارش",
                                  style: TextStyle(
                                    color: isDarkMode_ ? brown100 : brown300,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(height: 20),
                          const Text(
                            "آدرس مبدا و مقصد",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          // const SizedBox(height: 10),
                          const Divider(color: gray200),
                          AddressWidget(
                            sendersAddress: deliveryData["sendersAddress"],
                            recipientAddress: deliveryData["recipientAddress"],
                            showTitle: true,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shoppingBasket() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            ...widget.shoppingBasketData
                .sublist(0, 2)
                .map((e) => orderItem(itemData: e)),
          ],
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: isDarkMode_ ? primaryBlack : white,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              deliveryData["cafeName"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                        SizedBox(
                          height: 312,
                          width: double.infinity,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...widget.shoppingBasketData
                                      .map((e) => Column(
                                            children: [
                                              orderItem(itemData: e),
                                              DashSeparator(
                                                color: isDarkMode_
                                                    ? darkGray
                                                    : gray200,
                                              ),
                                            ],
                                          )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          icon: Icon(
            Icons.keyboard_double_arrow_up_rounded,
            color: isDarkMode_ ? brown100 : primaryBrown,
          ),
        ),
      ],
    );
  }

  Widget orderItem({required Map itemData}) {
    return Container(
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
                "${(double.parse(itemData["price"]) * itemData["number"]).toInt()} تومان",
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    itemData["title"] ?? "",
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode_ ? lightGray : darkGray,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                PersianNumber(
                  number: "X ${itemData["number"]}",
                  style: const TextStyle(
                    color: brown300,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
