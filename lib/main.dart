import 'package:calculator/models/custom_icons.dart';
import 'package:calculator/screens/home.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:calculator/theme/theme.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CustomIcons(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeManager(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Calculator',
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: const Home(),
          );
        });
  }
}
