import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:flutter_animate/flutter_animate.dart' as animate;
import 'package:venice_caffee/screens/main_screen.dart';

class FinishRegisterScreen extends StatefulWidget {
  const FinishRegisterScreen({super.key});

  @override
  State<FinishRegisterScreen> createState() => _FinishRegisterScreenState();
}

class _FinishRegisterScreenState extends State<FinishRegisterScreen> {
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
                child: Image.asset(
                  "assets/images/coffee_mug2.png",
                  width: 296,
                  height: 266,
                ),
              ),
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
                                "حساب کاربری شما با موفقیت ساخته شد",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "دیگه میتونی قهوه ای که دوست داری رو با خیلی خوراکیای خوشمزه و جذاب دیگه سفارش بدی",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: lightGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
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
                              "بزن بریم",
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
      ),
    );
  }
}
