import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/icon_with_text.dart';

class SpashScreen extends StatelessWidget {
  SpashScreen({super.key});
  bool isDarkMode_ = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWithText(textSize: 32),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Text(
                "ورژن 1.1.0",
                style: TextStyle(
                  color: isDarkMode_ ? brown100 : darkGray,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
