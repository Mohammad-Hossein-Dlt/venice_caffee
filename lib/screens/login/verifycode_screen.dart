import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/login/finish_register_screen.dart';
import 'package:venice_caffee/screens/main_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.isLogin});
  final bool isLogin;
  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool isDarkMode_ = false;

  late Timer countDown;

  Duration duration = const Duration(seconds: 59);

  void setCountDown() {
    int reduceSeconsBy = 1;
    setState(() {
      final curentSeconds = duration.inSeconds - reduceSeconsBy;
      if (curentSeconds <= 0) {
        duration = const Duration(seconds: 0);
        countDown.cancel();
      } else {
        duration = Duration(seconds: curentSeconds);
      }
    });
  }

  @override
  void initState() {
    countDown = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
    super.initState();
  }

  @override
  void dispose() {
    countDown.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      textStyle: TextStyle(
          fontSize: 20,
          color: isDarkMode_ ? white : primaryBlack,
          fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: isDarkMode_ ? darkGray : gray200),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryBrown),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: primaryBrown),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext, bool) => [
            SliverAppBar(
              pinned: true,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 76),
                          Text(
                            widget.isLogin ? "ورورد" : "ساخت حساب کاربری جدید",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "کد 5 رقمی را وارد کنید",
                            style: TextStyle(
                              color: lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Pinput(
                            autofocus: true,
                            preFilledWidget: Container(
                              width: 10,
                              height: 1,
                              decoration: const BoxDecoration(
                                color: darkGray,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                              ),
                            ),
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            enabled: duration.inSeconds != 0,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            length: 5,
                            onCompleted: (pin) {},
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PersianNumber(
                                number:
                                    "${(duration.inSeconds / 60).floor()}:${(duration.inSeconds % 60).floor() < 10 ? 00 : ''}${(duration.inSeconds % 60).floor()}",
                                style: const TextStyle(
                                  color: lightGray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(),
                                onPressed:
                                    duration.inSeconds == 0 ? () {} : null,
                                child: Text("ارسال دوباره کد",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: duration.inSeconds == 0
                                            ? primaryBrown
                                            : lightGray)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBrown,
                    maximumSize: const Size(double.infinity, 52),
                    minimumSize: const Size(double.infinity, 52),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  onPressed: () {
                    if (widget.isLogin) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainScreenNavigationBar(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FinishRegisterScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "ثبت",
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
        ),
      ),
    );
  }
}
