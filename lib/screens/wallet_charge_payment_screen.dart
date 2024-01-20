import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class WalletChargePaymentScreen extends StatefulWidget {
  const WalletChargePaymentScreen({
    super.key,
    required this.priceItems,
    required this.selectedPriceItem,
    required this.desiredPrice,
  });

  final List<String> priceItems;

  final ValueNotifier<String> selectedPriceItem;

  final TextEditingController desiredPrice;

  @override
  State<WalletChargePaymentScreen> createState() =>
      _WalletChargePaymentScreenState();
}

class _WalletChargePaymentScreenState extends State<WalletChargePaymentScreen> {
  bool isDarkMode_ = false;

  List<Map<String, String>> cafeAssistants = [
    {
      "name": "روژان",
      "image": "assets/images/person5.png",
    },
    {
      "name": "آیدا",
      "image": "assets/images/person8.png",
    },
    {
      "name": "محبوبه",
      "image": "assets/images/person9.png",
    },
    {
      "name": "دیانا",
      "image": "assets/images/person.png",
    },
  ];

  Map preferredCafeAssistant = {
    "name": "رز راد",
    "image": "assets/images/person2.png"
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
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
                bottom: 102,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "ارسال رسید پرداخت به :",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 62,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: blue200),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(80, 34),
                                  elevation: 0,
                                  backgroundColor: blue100,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "تغییر",
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: blue200,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      preferredCafeAssistant["name"],
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Image.asset(
                                      cafeAssistants.singleWhere(
                                            (element) =>
                                                element["name"] ==
                                                preferredCafeAssistant["name"],
                                            orElse: () => {
                                              "image":
                                                  "assets/images/person2.png",
                                            },
                                          )["image"] ??
                                          "assets/images/person2.png",
                                      width: 40,
                                      height: 40,
                                      scale: 0.5,
                                      errorBuilder:
                                          (BuildContext, Object, StackTrace) =>
                                              const Text("!خطا"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "پیشنهادی",
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
                          ...cafeAssistants.map((e) => cafeAssistantItem(e)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "ارسال رسید از طریق پیامک",
                        style: TextStyle(
                          color: lightGray,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
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
                          hintText: "شماره همراه را وارد کنید",
                          hintStyle: const TextStyle(
                              color: lightGray,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "رقم خود را انتخاب کنید",
                          style: TextStyle(
                            color: primaryBlack,
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
                          ...widget.priceItems.map((e) => moneyItem(e)),
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
                        controller: widget.desiredPrice,
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
                              color: lightGray,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
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
                      onPressed: () {},
                      child: const Text(
                        "پرداخت کن",
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
        backgroundColor: price == widget.selectedPriceItem.value
            ? brown400
            : isDarkMode_
                ? secondaryBlack
                : gray100,
        side: BorderSide(
          color: price == widget.selectedPriceItem.value
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
          widget.selectedPriceItem.value = price;
        });
      },
      child: PersianNumber(
        number: "$price ت",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: price == widget.selectedPriceItem.value
              ? white
              : isDarkMode_
                  ? white
                  : primaryBlack,
        ),
      ),
    );
  }

  Widget cafeAssistantItem(Map personData) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.zero,
        fixedSize: const Size(128, 44),
        elevation: 0,
        // maximumSize: const Size(102, 44),
        // minimumSize: const Size(102, 44),
        backgroundColor: personData["name"] == preferredCafeAssistant["name"]
            ? brown400
            : isDarkMode_
                ? secondaryBlack
                : gray100,
        side: BorderSide(
          color: personData["name"] == preferredCafeAssistant["name"]
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
          preferredCafeAssistant["name"] = personData["name"];
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              personData["name"],
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: personData["name"] == preferredCafeAssistant["name"]
                    ? Colors.white
                    : lightGray,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Image.asset(personData["image"]),
        ],
      ),
    );
  }
}
