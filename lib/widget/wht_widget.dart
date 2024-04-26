import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhtWidget extends StatelessWidget {
  String text;
  IconData icon;
  String text2;
  String text3;
  Color color;
  WhtWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.text2,
    required this.text3,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 15,
        ),
        Icon(icon, color: color),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text("$text2\u00B0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 35,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(
                      colors: [Colors.red, Color.fromARGB(255, 244, 150, 10)])),
            ),
            const SizedBox(
              width: 5,
            ),
            Text("$text3\u00B0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
          ],
        )
      ],
    );
  }
}
