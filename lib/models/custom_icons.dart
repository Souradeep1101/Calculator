import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIcons with ChangeNotifier {
  String calc = '';
  String ans = '';
  IconData icon;
  Function? onPressed;
  String newCalc = '';

  void onPressedIcon(String calculate) {
    calc += calculate;
    newCalc = calc;
    if (newCalc.contains('%')) {
      newCalc = newCalc.replaceAll('%', '*0.01');
      try {
        ans = eval(newCalc).toString();
      } catch (e) {
        ans = '';
      }
    } else {
      try {
        ans = eval(calc).toString();
      } catch (e) {
        ans = '';
      }
    }
    notifyListeners();
  }

  void onPressedClear() {
    calc = '';
    ans = '';
    notifyListeners();
  }

  void onPressedBackspace() {
    //ans = '';
    if (calc.isNotEmpty) {
      calc = calc.substring(0, calc.length - 1);
      if (ans.isNotEmpty) {
        try {
          ans = eval(calc).toString();
        } catch (e) {
          ans = '';
        }
      }
    }
    if (calc.isEmpty) {
      calc = '';
      ans = '';
    }
    notifyListeners();
  }

  void onPressedEquals() {
    calc = ans;
    ans = '';
    notifyListeners();
  }

  Future<void> onPressedGithub() async {
    Uri url = Uri.parse('https://github.com/Souradeep1101/Calculator');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  CustomIcons({this.icon = FontAwesomeIcons.cross, this.onPressed});
}

CustomIcons objectIconButtons = CustomIcons();
List<CustomIcons> iconButtons = [
  CustomIcons(
      icon: FontAwesomeIcons.c,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedClear();
      }),
  CustomIcons(
      icon: FontAwesomeIcons.percent,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '%',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.deleteLeft,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedBackspace();
      }),
  CustomIcons(
      icon: FontAwesomeIcons.divide,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '/',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.seven,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '7',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.eight,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '8',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.nine,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '9',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.xmark,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '*',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.four,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '4',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.five,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '5',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.six,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '6',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.minus,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '-',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.one,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '1',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.two,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '2',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.three,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '3',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.plus,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '+',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.zero,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '0',
        );
      }),
  CustomIcons(
      icon: Zocial.github_circled,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedGithub();
      }),
  CustomIcons(
      icon: Entypo.dot,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedIcon(
          '.',
        );
      }),
  CustomIcons(
      icon: FontAwesomeIcons.equals,
      onPressed: () {
        Provider.of<CustomIcons>(navigatorKey.currentContext!, listen: false)
            .onPressedEquals();
      }),
];
