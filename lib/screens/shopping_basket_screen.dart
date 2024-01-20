import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/order/order_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class ShoppingBasketScreen extends StatefulWidget {
  const ShoppingBasketScreen({super.key});

  @override
  State<ShoppingBasketScreen> createState() => _ShoppingBasketScreenState();
}

class _ShoppingBasketScreenState extends State<ShoppingBasketScreen> {
  bool isDarkMode_ = false;

  List<Map<String, dynamic>> shoppingBasketData = [
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte.png",
      "number": 1,
    },
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte.png",
      "number": 1,
    },
  ];

  List<Map<String, dynamic>> onShoppingBasket = [];

  @override
  void initState() {
    onShoppingBasket = List.of(shoppingBasketData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    String totalInvoice = onShoppingBasket.fold(
        "0",
        (previousValue, element) =>
            (((double.parse(element["price"]) / 1000) * element["number"]) +
                    double.parse(previousValue))
                .toInt()
                .toString());

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
              title: const Text(
                "سبد خرید",
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
                bottom: 102,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "سبد خرید",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      shoppingBasket(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: isDarkMode_ ? secondaryBlack : Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBrown,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            maximumSize: const Size(140, 52),
                            minimumSize: const Size(140, 52),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderScreen(
                                  shoppingBasketData: onShoppingBasket,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "سفارش بده",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Center(
                          child: Text(
                            "$totalInvoice ت",
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: primaryBrown,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text("همه"),
                          Checkbox(
                              checkColor: white,
                              activeColor: brown700,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              value: shoppingBasketData.every((element) =>
                                  onShoppingBasket.contains(element)),
                              onChanged: (value) {
                                if (value!) {
                                  setState(() {
                                    onShoppingBasket =
                                        List.of(shoppingBasketData);
                                  });
                                } else {
                                  setState(() {
                                    onShoppingBasket.clear();
                                  });
                                }
                              }),
                        ],
                      ),
                    ],
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
}
