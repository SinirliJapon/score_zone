import 'package:flutter/material.dart';
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
      trailing: Text(data, style: const TextStyle(fontSize: 16)),
      iconColor: premierPrimary,
      textColor: premierPrimary,
      tileColor: premierSecondary,
    );
  }
}