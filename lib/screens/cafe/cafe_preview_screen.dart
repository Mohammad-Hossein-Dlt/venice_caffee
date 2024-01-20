import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/cafe/cafe_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class CafePreviewScreen extends StatefulWidget {
  const CafePreviewScreen({super.key});

  @override
  State<CafePreviewScreen> createState() => _CafePreviewScreenState();
}

class _CafePreviewScreenState extends State<CafePreviewScreen> {
  Map cafeDetails = {
    "imagePreview": "assets/images/cafe.png",
    "imageList": [],
    "name": "کافه ونیز",
    "location": "فرشته - تهران",
    "commentsNumber": "بیش از 100 نظر",
    "commentsImageList": [
      "assets/images/person5.png",
      "assets/images/person6.png",
      "assets/images/person7.png",
      "assets/images/person8.png",
      "assets/images/person9.png",
    ],
    "capacity": "8",
    "description":
        "کافه ای فوق العاده در منطقه ی لوکس شهر. از امتیازات کافه ونیز میتوان به کیفیت بالای قهوه ها و محصولات دیگر ، برخورد گرم و محترمانه ی کارکنان ، فضای آرام ، فاصله مناسب میزها از هم برای حفظ حریم خصوصی و جای پارک مناسب اشاره کرد.",
  };
  @override
  Widget build(BuildContext context) {
    bool isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 340,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            cafeDetails["imagePreview"],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cafeDetails["name"],
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: isDarkMode_ ? white : secondaryBrown,
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
                            style: TextStyle(
                              color: isDarkMode_ ? lightGray : brown400,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Iconsax.location,
                          color: isDarkMode_ ? lightGray : brown400,
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
                            number: cafeDetails["commentsNumber"],
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: isDarkMode_ ? lightGray : brown400,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: brown100),
                    const SizedBox(height: 10),
                    Text(
                      cafeDetails["description"],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBrown,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    maximumSize: const Size(double.infinity, 52),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CafeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "مشاهده بیشتر",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
}
