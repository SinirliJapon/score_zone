import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';

class CustomTabBar extends StatelessWidget {
  final Color indicatorColor;
  final List<Widget> tabs;

  const CustomTabBar({
    required this.indicatorColor,
    required this.tabs,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 45,
        color: Colors.white,
        child: TabBar(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: indicatorColor, width: 4.0, style: BorderStyle.solid),
            insets: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: primaryText,
          unselectedLabelColor: primaryText,
          tabs: tabs,
        ),
      ),
    );
  }
}
