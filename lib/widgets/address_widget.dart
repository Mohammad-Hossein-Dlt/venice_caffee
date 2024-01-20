import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/main.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget({
    super.key,
    this.showTitle = false,
    required this.sendersAddress,
    required this.recipientAddress,
  });

  bool _isDarkMode = false;

  final bool showTitle;

  final String sendersAddress;
  final String recipientAddress;
  @override
  Widget build(BuildContext context) {
    _isDarkMode = AppTheme.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                showTitle
                    ? const Text(
                        "آدرس ارسال کننده",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: lightGray,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  sendersAddress,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            const Icon(
              Iconsax.location5,
              color: green600,
              size: 24,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            children: [
              Container(
                width: 3.4,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: const BoxDecoration(
                  color: green600,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              Container(
                width: 3.4,
                height: 14,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: const BoxDecoration(
                  color: green600,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              Container(
                width: 3.4,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: const BoxDecoration(
                  color: green600,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                showTitle
                    ? const Text(
                        "آدرس تحویل گیرنده",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: lightGray,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  recipientAddress,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(width: 10),
            const Icon(
              Iconsax.flag_25,
              color: green600,
              size: 24,
            ),
          ],
        ),
      ],
    );
  }
}
