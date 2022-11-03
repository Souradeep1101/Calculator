import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  IconData icon;
  Color? buttonColor;
  Color? splashColor;
  Function? onPressed;

  Button(
      {Key? key,
      required this.icon,
      this.buttonColor,
      this.splashColor,
      this.onPressed})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  dynamic savedThemeMode;

  getThemeMode() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
  }

  @override
  void initState() {
    // TODO: implement initState
    getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonColor == null && widget.splashColor == null) {
      if (Provider.of<ThemeManager>(context).keyCheck) {
        widget.buttonColor = Colors.grey[200];
        widget.splashColor = Colors.black38;
      } else {
        widget.buttonColor = Colors.black;
        widget.splashColor = Colors.white38;
      }
    }
    return SizedBox(
        width: 20,
        height: 28,
        child: TextButton(
          onPressed: () => widget.onPressed?.call(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(widget.buttonColor),
            // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) {
                return widget.splashColor;
              } // <-- Splash color
            }),
          ),
          child: Icon(
            widget.icon,
            size: 24,
            color: Theme.of(context).iconTheme.color,
          ),
        ));
  }
}
