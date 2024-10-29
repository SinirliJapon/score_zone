import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:score_zone/utils/colors.dart';

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
      trailing: infoTrailing(),
      leadingAndTrailingTextStyle: const TextStyle(fontSize: 16),
      iconColor: primaryText,
      textColor: primaryText,
      tileColor: secondaryText,
    );
  }

  Widget infoTrailing() {
    if (data.length > 20) {
      return SizedBox(
        width: 150,
        child: Marquee(
          text: data,
          velocity: 30.0,
          blankSpace: 20.0,
          scrollAxis: Axis.horizontal,
          style: const TextStyle(fontSize: 16, color: primaryText),
          startAfter: const Duration(seconds: 1),
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
    } else {
      return Text(data);
    }
  }
}
