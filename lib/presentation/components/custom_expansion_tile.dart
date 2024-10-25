import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';

class CustomExpansionTile extends StatelessWidget {
  final bool isOpen;
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.isOpen,
    required this.icon,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ExpansionTile(
        maintainState: true,
        initiallyExpanded: isOpen,
        leading: Icon(icon),
        collapsedBackgroundColor: primaryColor,
        collapsedIconColor: secondaryColor,
        collapsedTextColor: secondaryColor,
        backgroundColor: secondaryText,
        iconColor: primaryText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: children,
      ),
    );
  }
}
