import 'package:calculator/models/custom_icons.dart';
import 'package:calculator/theme/theme_manager.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: MediaQuery.of(context).size.width,
      //height: 400,
      decoration: BoxDecoration(
          color: Provider.of<ThemeManager>(context).backgroundColor),
      child: GridView.builder(
          //padding: EdgeInsets.only(top: 22,),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 4,
          ),
          itemCount: iconButtons.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 3 || index == 7 || index == 11 || index == 15) {
              return Button(
                icon: iconButtons[index].icon,
                onPressed: iconButtons[index].onPressed,
                buttonColor: Colors.amber,
                splashColor: Colors.amberAccent,
              );
            } else if (index == 19) {
              return Button(
                icon: iconButtons[index].icon,
                onPressed: iconButtons[index].onPressed,
                buttonColor: Colors.lightBlueAccent,
                splashColor: Colors.lightBlue,
              );
            } else {
              return Button(
                icon: iconButtons[index].icon,
                onPressed: iconButtons[index].onPressed,
              );
            }
          }),
    );
  }
}
