import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/order/order_screen.dart';
import 'package:venice_caffee/screens/reservation/billing_reservation_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class CafeScreen extends StatefulWidget {
  const CafeScreen({super.key});

  @override
  State<CafeScreen> createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {
  bool isDarkMode_ = false;
  Map cafeDetails = {
    "imagePreview": "assets/images/cafe.png",
    "imageList": [
      "assets/images/cafe_2.png",
      "assets/images/cafe_2.png",
    ],
    "name": "کافه ونیز",
    "location": "فرشته - تهران",
    "approximateCommentsNumber": "بیش از 100 نظر",
    "commentsNumber": "104",
    "commentsImageList": [
      "assets/images/person5.png",
      "assets/images/person6.png",
      "assets/images/person7.png",
      "assets/images/person8.png",
      "assets/images/person9.png",
    ],
    "capacity": "8",
    "hourlyCost": "152000",
    "description":
        "کافه ای فوق العاده در منطقه ی لوکس شهر. از امتیازات کافه ونیز میتوان به کیفیت بالای قهوه ها و محصولات دیگر ، برخورد گرم و محترمانه ی کارکنان ، فضای آرام ، فاصله مناسب میزها از هم برای حفظ حریم خصوصی و جای پارک مناسب اشاره کرد.",
  };
  List imageList = [];

  List<Map> commentsList = [
    {
      "userName": "رضا پور",
      "userProfileImage": "assets/images/person10.png",
      "commentCreationDate": "2 اردیبهشت 1402",
      "score": "5",
      "text":
          "همه چی عالی بود. آیتما سریع و گرم به دستم رسید و از نظر کیفیت بی نقص بودن.",
    },
    {
      "userName": "محدثه",
      "userProfileImage": "assets/images/person11.png",
      "commentCreationDate": "29 فروردین 1402",
      "score": "5",
      "text": "یکی از بهترین قهوه هایی بود که تا حالا خوردم.",
    },
  ];

  List<Map<String, dynamic>> menuList = [
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte_2.png",
      "number": 1,
    },
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte_2.png",
      "number": 1,
    },
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte_2.png",
      "number": 0,
    },
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte_2.png",
      "number": 1,
    },
    {
      "title": "لاته فندوق",
      "price": "73000",
      "image": "assets/images/hazelnut_latte_2.png",
      "number": 1,
    },
  ];

  @override
  void initState() {
    imageList = cafeDetails["imageList"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    String totalInvoice = menuList.fold("0", (previousValue, element) {
      return (double.parse(previousValue) +
              (double.parse(element["price"]) * element["number"]))
          .toInt()
          .toString();
    });
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext, bool) => [
              SliverAppBar(
                title: const Text(
                  "اطلاعات کافه",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.heart,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                        child: Icon(
                          Iconsax.arrow_right_3,
                          color: white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageListItem(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            cafeDetails["name"],
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: isDarkMode_ ? white : primaryBlack,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  cafeDetails["location"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    color: lightGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Iconsax.location,
                                color: lightGray,
                                size: 18,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commentsImageList(),
                              Expanded(
                                child: PersianNumber(
                                  number:
                                      cafeDetails["approximateCommentsNumber"],
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                    color: lightGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                            child: TabBar(
                              dividerColor: gray100,
                              indicatorPadding: EdgeInsets.zero,
                              // in: double.infinity,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: brown400,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: lightGray,
                              ),
                              indicatorColor: primaryBrown,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                                Tab(
                                  text: "منوی کافه",
                                ),
                                Tab(
                                  text: "اطلاعات کافه",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: TabBarView(
              children: [
                // reserve(),
                Stack(
                  children: [
                    Positioned.fill(
                      bottom: 80,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: cafeMenu(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: isDarkMode_ ? secondaryBlack : white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBrown,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    maximumSize: const Size(160, 52),
                                    minimumSize: const Size(160, 52),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen(
                                                shoppingBasketData: menuList,
                                              )),
                                    );
                                  },
                                  child: const Text(
                                    "تکمیل سفارش",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "${(int.parse(totalInvoice) / 1000).toInt().toString()} ت",
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: primaryBrown,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned.fill(
                      bottom: 80,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: reserve(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: isDarkMode_ ? secondaryBlack : white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBrown,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    maximumSize: const Size(160, 52),
                                    minimumSize: const Size(160, 52),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BillingReservationScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "تکمیل سفارش",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "/ ساعت",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: lightGray,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  PersianNumber(
                                    number:
                                        "${(int.parse(cafeDetails["hourlyCost"]) / 1000).toInt().toString()} ت",
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: primaryBrown,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reserve() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: brown300,
                border: Border.all(
                  color: isDarkMode_ ? Colors.transparent : white,
                ),
              ),
              child: Center(
                child: PersianNumber(
                  number: "${cafeDetails['capacity']} عدد باقی مانده",
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: white,
                  ),
                ),
              ),
            ),
            const Text(
              "ظرفیت",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: lightGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "توضیحات",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              cafeDetails["description"],
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: isDarkMode_ ? lightGray : darkGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: brown300,
                border: Border.all(
                  color: isDarkMode_ ? Colors.transparent : white,
                ),
              ),
              child: Center(
                child: PersianNumber(
                  number: cafeDetails["commentsNumber"],
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "نظرات",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        ...commentsList.map(
          (e) => commentItem(commentData: e),
        ),
        const SizedBox(height: 10),
        Center(
          child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(160, 40),
                maximumSize: const Size(160, 40),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Iconsax.arrow_down_1,
                    color: lightGray,
                    size: 16,
                  ),
                  Text(
                    "مشاهده همه",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: lightGray,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget cafeMenu() {
    return Column(
      children: [
        ...menuList.map((e) => menuItem(menuItemData: e)),
      ],
    );
  }

  Widget commentsImageList() {
    List commentsImageList_ = cafeDetails["commentsImageList"];

    double coverWidth = 8;
    double imageSize = 25;

    return SizedBox(
      height: imageSize + 20,
      width: (commentsImageList_.length * imageSize) -
          ((commentsImageList_.length - 1) * coverWidth),
      child: Stack(
        children: [
          ...commentsImageList_.map(
            (e) => Positioned(
              top: 0,
              bottom: 0,
              left: commentsImageList_.indexOf(e) != 0
                  ? (commentsImageList_.indexOf(e) * imageSize) -
                      (commentsImageList_.indexOf(e) * coverWidth)
                  : 0,
              child: Image.asset(
                e,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commentItem({required Map commentData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PersianNumber(
                            number: commentData["score"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.star,
                            color: yellow500,
                            size: 24,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              commentData["userName"],
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            PersianNumber(
                              number: commentData["commentCreationDate"],
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: lightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    commentData["text"],
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: isDarkMode_ ? lightGray : darkGray,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              commentData["userProfileImage"],
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageListItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          ...imageList.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                // left: (imageList.indexOf(e) + 1) == imageList.length
                //     ? 20
                //     : 0,
              ),
              child: Image.asset(
                e,
                width: 250,
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem({required Map<String, dynamic> menuItemData}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      shadowColor: Theme.of(context).colorScheme.shadow,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode_ ? secondaryBlack : white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (menuItemData["number"] != 0) {
                            setState(() {
                              menuList[menuList.indexOf(menuItemData)]
                                  ["number"]--;
                            });
                          }
                        },
                        icon: Icon(Icons.arrow_left_rounded,
                            color: menuItemData["number"] != 0
                                ? brown300
                                : brown50,
                            size: 44),
                      ),
                      Text(menuItemData["number"].toString()),
                      IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          setState(() {
                            menuList[menuList.indexOf(menuItemData)]
                                ["number"]++;
                          });
                        },
                        icon: const Icon(Icons.arrow_right_rounded,
                            color: brown300, size: 44),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          menuItemData["title"] ?? "",
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode_ ? white : brown700,
                          ),
                        ),
                        PersianNumber(
                          number: "${menuItemData["price"]} تومان",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: brown300,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              menuItemData["image"] ?? "",
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
