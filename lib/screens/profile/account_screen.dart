import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenScreenState();
}

class _AccountScreenScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حساب کاربری",
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).viewPadding.top +
                    MediaQuery.of(context).viewPadding.bottom +
                    kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      item(
                        title: "حریم شخصی",
                        subTitle: "برای محافظت بیشتر از حساب کاربری",
                        icon: const Icon(
                          Iconsax.lock,
                          size: 24,
                        ),
                        function: () {},
                      ),
                      const Divider(),
                      item(
                        title: "تاییدیه دو مرحله ای",
                        subTitle: "تنظیم تایید 2 مرحله ای برای امنیت بیشتر",
                        icon: const Icon(
                          Iconsax.password_check,
                          size: 24,
                        ),
                        function: () {},
                      ),
                      const Divider(),
                      item(
                        title: "امنیت",
                        subTitle: "مدیریت امنیت حساب کاربری",
                        icon: const Icon(
                          Iconsax.shield_security2,
                          color: primaryBrown,
                          size: 24,
                        ),
                        function: () {},
                      ),
                      const Divider(),
                      item(
                        title: "اطلاعات حساب کاربری",
                        subTitle: "ایمیل ، شماره همراه ، آدرس ...",
                        icon: const Icon(
                          Iconsax.shield_security2,
                          size: 24,
                        ),
                        function: () {},
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      maximumSize: const Size(double.infinity, 52),
                      minimumSize: const Size(double.infinity, 52),
                      side: const BorderSide(color: gray200),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "خروج از حساب",
                      style: TextStyle(
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
      ),
    );
  }

  Widget item({
    required String title,
    String? subTitle,
    required Widget icon,
    required Function() function,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: () {
                function();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        // color: primaryBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                subTitle != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            subTitle,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              color: lightGray,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: icon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
