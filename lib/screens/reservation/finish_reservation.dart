import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:flutter_animate/flutter_animate.dart' as animate;
import 'package:venice_caffee/screens/main_screen.dart';

class FinishReservationScreen extends StatefulWidget {
  const FinishReservationScreen({super.key});

  @override
  State<FinishReservationScreen> createState() =>
      _FinishReservationScreenState();
}

class _FinishReservationScreenState extends State<FinishReservationScreen> {
  int index = 0;
  PageController controller =
      PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              animate.Animate(
                  effects: const [
                    animate.FadeEffect(duration: Duration(milliseconds: 650)),
                    animate.SlideEffect(duration: Duration(milliseconds: 650)),
                  ],
                  child: SizedBox(
                    width: 296,
                    height: 266,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/coffee_mug3.png",
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 50,
                          child: Image.asset(
                            "assets/images/chocolate.png",
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimationLimiter(
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
                              const Text(
                                "رزرو شما با موفقیت انجام شد",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "شما میتونید با وارد کردن اطلاعات ، رزرو خود را مشاهده کنید.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: lightGray,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainScreenNavigationBar(),
                                ),
                              );
                            },
                            child: const Text(
                              "باز گشت به صفحه اصلی",
                              style: TextStyle(
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
      ),
    );
  }
}
