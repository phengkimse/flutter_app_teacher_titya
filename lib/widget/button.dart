import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  //color button
  final Color? bgColor;
  //lable
  final String text;
  //true = big size, false = small size
  final bool? fullSize;
  final VoidCallback onPressed;
  const ButtonWidget(
      {super.key,
      this.bgColor = Colors.red,
      required this.text,
      required this.onPressed,
      this.fullSize = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullSize!
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.5,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
