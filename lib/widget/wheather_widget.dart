import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WheatherWidget extends StatelessWidget {
  String text;
  String text2;
  IconData icon;
  Color color;
  WheatherWidget({super.key, required this.text, required this.icon, required this.text2, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 5,
        ),
        Icon(icon, color: color),
        SizedBox(
          height: 5,
        ),
        Text("$text2\u00B0",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
