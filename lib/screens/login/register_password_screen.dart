import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/screens/login/verifycode_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen({
    super.key,
  });
  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode_ = AppTheme.isDarkMode(context);

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
                          const Text(
                            "ساخت حساب کاربری جدید",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "کلمه عبور خود را وارد کنید",
                                style: TextStyle(
                                  color: lightGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            "کلمه عبور",
                            style: TextStyle(
                              color: lightGray,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            textDirection: TextDirection.ltr,
                            maxLines: 1,
                            minLines: 1,
                            obscureText: showPassword,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide:
                                      BorderSide(color: brown400, width: 1.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: isDarkMode_ ? darkGray : gray100,
                                      width: 1)),
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                              hintText: "کلمه عبور",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  )),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "کلمه ی عبور شما باید حداقل 8 حرف باشد",
                            style: TextStyle(
                              color: lightGray,
                              fontSize: 14,
                            ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const VerifyCodeScreen(isLogin: false),
                      ),
                    );
                  },
                  child: const Text(
                    "تایید اطلاعات",
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
