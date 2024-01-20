import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/order/delivery_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/address_widget.dart';
import 'package:venice_caffee/widgets/dash_separator.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    required this.shoppingBasketData,
  });
  final List<Map<String, dynamic>> shoppingBasketData;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isDarkMode_ = false;

  List<Map<String, dynamic>> shoppingBasketData = [];

  List<Map<String, dynamic>> onShoppingBasket = [];

  Map<String, dynamic> factor = {
    "totalOrder": "0",
    "shippingCost": "10000",
    "packagingCost": "0",
    "discount": "35000",
  };

  Map addreess = {
    "sendersAddress": "نبش جام جم - کافه سولر",
    "recipientAddress": "آفریقا - لادن - پ ۱۷",
  };

  @override
  void initState() {
    shoppingBasketData = List.of(widget.shoppingBasketData);
    onShoppingBasket = List.of(widget.shoppingBasketData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    factor["totalOrder"] = onShoppingBasket.fold(
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              title: const Text(
                "سفارش",
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
          body: SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).viewPadding.top +
                    MediaQuery.of(context).viewPadding.bottom +
                    kToolbarHeight),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 110,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        AddressWidget(
                          sendersAddress: addreess["sendersAddress"],
                          recipientAddress: addreess["recipientAddress"],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isDarkMode_ ? secondaryBlack : gray100,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            minLines: 1,
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: brown400, width: 1.4)),
                                enabledBorder: InputBorder.none,
                                hintTextDirection: TextDirection.rtl,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                hintText: "یادداشت برای راننده...",
                                hintStyle: const TextStyle(
                                  color: lightGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                suffixIcon: Icon(
                                  Iconsax.note_add,
                                  color: isDarkMode_ ? lightGray : primaryBlack,
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DashSeparator(
                            color: isDarkMode_ ? darkGray : gray100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "+ اضافه کردن",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode_ ? blue400 : blue600,
                                  ),
                                ),
                              ),
                              const Text(
                                "لیست خرید",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        shoppingBasket(),
                        factorItem(
                          totalOrder: factor["totalOrder"],
                          shippingCost: factor["shippingCost"],
                          packagingCost: factor["packagingCost"],
                          discount: factor["discount"],
                          totalInvoice: totalInvoice,
                        ),
                        const SizedBox(height: 20),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 88,
                                  height: 28,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: const BoxDecoration(
                                    color: green600,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "کیف پول",
                                      style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "پرداخت با",
                                  style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold,
                                    // color: darkGray,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                    height: 110,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: isDarkMode_ ? secondaryBlack : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.menu,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 88,
                                  height: 28,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: const BoxDecoration(
                                    color: green600,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "کیف پول",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                PersianNumber(
                                  number: "$totalInvoice تومان",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
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
                                  builder: (context) => DeliveryScreen(
                                    shoppingBasketData:
                                        widget.shoppingBasketData,
                                    factor: factor,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "پرداخت",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                      ],
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

  Widget shoppingBasket() {
    return Row(
      children: [
        Column(
          children: [
            ...shoppingBasketData.map(
              (e) => orderItem(itemData: e),
            ),
          ],
        ),
      ],
    );
  }

  Widget orderItem({required Map<String, dynamic> itemData}) {
    return Card(
      color: isDarkMode_ ? secondaryBlack : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      shadowColor: Theme.of(context).colorScheme.shadow,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isDarkMode_ ? secondaryBlack : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          itemData["title"] ?? "",
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode_ ? white : brown700,
                          ),
                        ),
                        PersianNumber(
                          number: "${itemData["price"]} تومان",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: brown300,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                if (itemData["number"] != 0) {
                                  setState(() {
                                    shoppingBasketData[shoppingBasketData
                                        .indexOf(itemData)]["number"]--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.arrow_left_rounded,
                                  color: brown300, size: 44),
                            ),
                            Text(itemData["number"].toString()),
                            IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                setState(() {
                                  shoppingBasketData[shoppingBasketData
                                      .indexOf(itemData)]["number"]++;
                                });
                              },
                              icon: const Icon(Icons.arrow_right_rounded,
                                  color: brown300, size: 44),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    itemData["image"] ?? "",
                    width: 50,
                    height: 50,
                  ),
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: brown700,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      value: onShoppingBasket.contains(itemData),
                      onChanged: (value) {
                        setState(() {
                          if (onShoppingBasket.contains(itemData)) {
                            onShoppingBasket.remove(itemData);
                          } else {
                            onShoppingBasket.add(itemData);
                          }
                        });
                      }),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    setState(() {
                      shoppingBasketData.remove(itemData);
                      onShoppingBasket.remove(itemData);
                    });
                  },
                  icon: Icon(Iconsax.close_circle,
                      color: isDarkMode_ ? darkGray : lightGray, size: 24),
                ),
              ),
            ],
          ),
        ),
      ),
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
        const SizedBox(height: 20),
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
        DashSeparator(color: isDarkMode_ ? darkGray : gray100),
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
        DashSeparator(color: isDarkMode_ ? darkGray : gray100),
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
        DashSeparator(color: isDarkMode_ ? darkGray : gray100),
        const SizedBox(height: 10),
      ],
    );
  }
}
