import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';

class CustomExpansionTile extends StatelessWidget {
  final bool isOpen;
  final IconData icon;
  final String title;
  final List<Widget> children;

  const CustomExpansionTile(
      {super.key, required this.isOpen, required this.icon, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isOpen,
      leading: Icon(icon),
      collapsedBackgroundColor: premierPrimary,
      iconColor: premierPrimary,
      collapsedIconColor: premierSecondary,
      collapsedTextColor: premierSecondary,
      backgroundColor: premierSecondary,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: children,
    );
  }
}