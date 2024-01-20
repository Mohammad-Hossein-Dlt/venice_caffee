import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/screens/login/forget_password.dart';
import 'package:venice_caffee/screens/login/name_and_family.dart';
import 'package:venice_caffee/screens/login/verifycode_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/icon_with_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode_ = AppTheme.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).viewPadding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: IconWithText(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "شماره موبایل یا ایمیل",
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
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        hintText: "شماره موبایل یا ایمیل",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        hintText: "کلمه عبور",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "فراموشی کلمه عبور",
                            style: TextStyle(
                              color: isDarkMode_ ? Colors.white : lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "مرا بخاطر بسپار",
                              style: TextStyle(
                                color: isDarkMode_ ? Colors.white : lightGray,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Checkbox(
                                activeColor: primaryBrown,
                                value: rememberMe,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    rememberMe = newValue ?? true;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBrown,
                        maximumSize: const Size(328, 52),
                        minimumSize: const Size(328, 52),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const VerifyCodeScreen(isLogin: true),
                          ),
                        );
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
                    const SizedBox(height: 20),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        maximumSize: const Size(328, 52),
                        minimumSize: const Size(328, 52),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        side: const BorderSide(color: brown50, width: 1.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NameAndFamilyScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "ساخت حساب کاربری",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Divider(color: lightGray)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "یا وارد شدن با",
                            style: TextStyle(
                              color: lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: lightGray)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(56, 56),
                              minimumSize: const Size(56, 56),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              side:
                                  const BorderSide(color: gray100, width: 1.8),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/google.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(56, 56),
                              minimumSize: const Size(56, 56),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              side:
                                  const BorderSide(color: gray100, width: 1.8),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/facebook.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              maximumSize: const Size(56, 56),
                              minimumSize: const Size(56, 56),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              side:
                                  const BorderSide(color: gray100, width: 1.8),
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/apple.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
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
}
