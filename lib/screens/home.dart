import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/screens/keyboard.dart';
import 'package:calculator/screens/screen.dart';
import 'package:calculator/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool? themeCheck = true;
  dynamic savedThemeMode;

  getThemeMode() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode == AdaptiveThemeMode.light ||
        savedThemeMode == AdaptiveThemeMode.system) {
      themeCheck = true;
      Provider.of<ThemeManager>(context, listen: false).onLightTheme(false);
    } else if (savedThemeMode == AdaptiveThemeMode.dark) {
      Provider.of<ThemeManager>(context, listen: false).onDarkTheme(false);
      themeCheck = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                themeCheck = !themeCheck!;
                if (themeCheck! == true) {
                  Provider.of<ThemeManager>(context, listen: false)
                      .onLightTheme(true);
                } else if (themeCheck! == false) {
                  Provider.of<ThemeManager>(context, listen: false)
                      .onDarkTheme(true);
                }
              },
              icon: Icon(Provider.of<ThemeManager>(context).themeCheckIcon)),
          IconButton(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Calculator',
                    applicationVersion: '1.0.0',
                    applicationIcon: const Icon(
                      FontAwesomeIcons.calculator,
                      size: 50,
                    ),
                    children: [
                      const Text(
                        'Developed by Souradeep Banerjee',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ]);
              },
              icon: const Icon(Icons.flutter_dash_outlined)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: Screen()),
          Keyboard(),
        ],
      ),
    );
  }
}
