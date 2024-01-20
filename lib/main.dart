import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venice_caffee/screens/splash_screen.dart';
import 'package:venice_caffee/screens/welcome_screen.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/utils/theme/theme_provider.dart';

void main() {
  runApp(const VeniceCoffee());
}

class VeniceCoffee extends StatefulWidget {
  const VeniceCoffee({super.key});

  @override
  State<VeniceCoffee> createState() => _VeniceCoffeeState();
}

class _VeniceCoffeeState extends State<VeniceCoffee> {
  ThemeProvider themeProvider = ThemeProvider();

  Widget home = SpashScreen();

  void getTheme() async {
    themeProvider.setTheme = await themeProvider.themePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getTheme();
    splash();
  }

  void splash() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          home = const WelcomeScreen();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext) {
        return themeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (buildContext, value, child) => MaterialApp(
          theme: AppTheme.theme(
            theme: themeProvider.theme,
          ),
          debugShowCheckedModeBanner: false,
          home: home,
        ),
      ),
    );
  }
}
