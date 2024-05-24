import 'package:flutter/material.dart';

class BlankLayout extends StatelessWidget {
  const BlankLayout(
      {super.key,
      required this.body,
      required this.text,
      this.bottomNavigationBar,
      this.endDrawer,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.color,
      this.iconColor,
      this.buttonBackgroundColor});

  final Widget text;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? color;
  final Color? iconColor;
  final Color? buttonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: endDrawer,
      appBar: buildAppBar(),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: text,
      automaticallyImplyLeading: true,
      // backgroundColor: TheColors.light,
      elevation: 0,
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {},
      // ),
    );
  }
}
