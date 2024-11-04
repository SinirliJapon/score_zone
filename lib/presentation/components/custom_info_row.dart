import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/functions.dart';

class CustomInfoRow extends StatelessWidget {
  final IconData icon;
  final String info;
  final String data;

  const CustomInfoRow({super.key, required this.icon, required this.info, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(info),
      trailing: Functions.infoTrailing(data, 150),
      leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
      iconColor: primaryText,
      textColor: primaryText,
      tileColor: secondaryText,
    );
  }
}
