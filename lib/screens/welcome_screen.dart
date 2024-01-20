import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:flutter_animate/flutter_animate.dart' as animate;
import 'package:venice_caffee/screens/login/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Map<String, String>> descriptions = [
    {
      "Title": "از کافه ی مورد علاقه ت خرید کن",
      "SubTitle": "آماده شید تا جدیدترین نوع قهوه روبا دوستات امتحان کنی"
    },
    {
      "Title": "بیاید انواع قهوه رو باهم بررسی کنیم",
      "SubTitle": "برای چشیدن یه طعم خاص"
    },
    {
      "Title": "بیاید انواع قهوه رو باهم بررسی کنیم",
      "SubTitle": "بیاید طعم های مختلف قهوه رو با ما تنها با چند کلیک کشف کنیم"
    },
  ];

  int index = 0;
  PageController controller =
      PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 494,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      "assets/images/welcome_bg.png",
                      // width: double.infinity,
                      // height: 494,
                    ),
                  ),
                ),
                animate.Animate(
                  effects: const [
                    animate.FadeEffect(duration: Duration(milliseconds: 650)),
                    animate.SlideEffect(duration: Duration(milliseconds: 650)),
                  ],
                  child: Image.asset(
                    "assets/images/coffee_mug.png",
                    width: 316,
                    height: 215,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        description(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SmoothPageIndicator(
                        controller: PageController(
                            viewportFraction: 1, initialPage: index),
                        count: descriptions.length,
                        textDirection: TextDirection.rtl,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 4,
                          dotWidth: 4,
                          dotColor: lightGray,
                          activeDotColor: primaryBrown,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBrown,
                            maximumSize: const Size(double.infinity, 52),
                            minimumSize: const Size(double.infinity, 52),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          onPressed: () {
                            index++;

                            if (index == descriptions.length) {
                              index = 0;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                            setState(() {});

                            // controller.animateToPage(index,
                            //     duration: const Duration(milliseconds: 500),
                            //     curve: Curves.easeIn);
                          },
                          child: const Text(
                            "بعدی",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }

  Widget description() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(seconds: 1),
            childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: -50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
            children: [
              Text(
                descriptions[index]["Title"] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                descriptions[index]["SubTitle"] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: lightGray,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}
