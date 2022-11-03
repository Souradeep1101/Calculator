import 'package:calculator/models/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            Provider.of<CustomIcons>(context).calc,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
          ),
          Text(
            Provider.of<CustomIcons>(context).ans,
            style: const TextStyle(
              fontSize: 34,
            ),
          ),
        ],
      ),
    );
  }
}
