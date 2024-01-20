import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';

class IconWithText extends StatelessWidget {
  IconWithText({super.key, this.textSize = 18});
  bool isDarkMode_ = false;

  final double textSize;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/icon.png",
          width: 66,
          height: 66,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ونیز",
              style: TextStyle(
                color: isDarkMode_ ? white : brown800,
                fontSize: textSize,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              "کافه",
              style: TextStyle(
                color: isDarkMode_ ? brown200 : brown100,
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
